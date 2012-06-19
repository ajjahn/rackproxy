# Rackproxy

A Rack App compatible HTTP Proxy

## Installation

Add this line to your application's Gemfile:

    gem 'rackproxy'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rackproxy

## Usage

```ruby
# config.ru
require 'rackproxy'

run Rack::Proxy.new('https://github.com')
```

    $ rackup config.ru

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
