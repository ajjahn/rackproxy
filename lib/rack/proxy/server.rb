require 'net/http'

module Rack::Proxy
  class Server
    def initialize(host, options = {})
      @host = URI(host)
      @options = options
    end
    
    def call(env)
      request = Rack::Request.new(env)
      uri = URI(request.url)
      
      uri.scheme, uri.userinfo, uri.host, uri.port = @host.scheme, @host.userinfo, @host.host, @host.port

      forward_request = Net::HTTP.const_get(request_method(request)).new(uri.request_uri)
      if forward_request.request_body_permitted? and request.body
        forward_request.body_stream = request.body
        forward_request.content_length = request.content_length
        forward_request.content_type = request.content_type
      end

      forward_request["Referer"] = request.referer

      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = uri.scheme == 'https' ? true : false
      forward_response = http.request(forward_request)

      headers = {}
      forward_response.each_header do |k,v|
        headers[k] = v unless k.to_s =~ /status/i
      end

      [forward_response.code.to_i, headers, [forward_response.read_body]]      
    end
    
  private
    
    def request_method(request)
      method = request.request_method.downcase
      method[0..0] = method[0..0].upcase
      
      method
    end
    
  end
end