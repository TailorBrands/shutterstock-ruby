require 'json'
require 'rest_client'
require 'shutterstock-ruby/configuration'
require 'shutterstock-ruby/connections'
require 'shutterstock-ruby/images'
require 'shutterstock-ruby/videos'

# Top level name space for the entire Gem.
module ShutterstockRuby
  API_BASE = 'api.shutterstock.com/v2'

  def self.configuration
    @configuration ||=  Configuration.new({})
  end

  def self.configure
    self.configuration ||= Configuration.new({})
    yield(configuration) if block_given?
  end

  class Client
    attr_reader :configuration, :videos, :images

    def initialize(args = {})
      @configuration = Configuration.new(args)
      @videos = Videos.new(configuration)
      @images = Images.new(configuration)
    end

  end
end
