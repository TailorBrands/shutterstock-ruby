require 'json'
require 'rest_client'
require 'shutterstock-ruby/connections'
require 'shutterstock-ruby/images'
require 'shutterstock-ruby/videos'

# Top level name space for the entire Gem.
module ShutterstockRuby
  API_BASE = 'api.shutterstock.com/v2'

  def self.configuration
    @configuration ||=  Configuration.new
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration) if block_given?
  end

  # Main configuration class.
  class Configuration
    attr_accessor :access_token
    attr_accessor :api_client
    attr_accessor :api_secret

    def initialize
      @access_token = nil
      @api_client = nil
      @api_secret = nil
    end
  end
end
