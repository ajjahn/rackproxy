require 'rack'
require 'rack/proxy/server'
require 'rack/proxy/version'

module Rack::Proxy
  def self.new(*args, &block)
    Server.new(*args, &block)
  end
end