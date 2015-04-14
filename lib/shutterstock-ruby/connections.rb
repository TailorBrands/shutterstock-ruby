module ShutterstockRuby
  module Connections
    def get(path, params = nil, options = {})
      ensure_credentials!

      options = { accept: :json }.merge(options)
      options[:params] = params unless params.nil?

      RestClient.get(build_url(path), options)
    end

    def post(path, body, options = {})
      ensure_credentials!

      RestClient.post(build_url(path), body, options)
    end

    private

    def build_url(path)
      "https://#{ShutterstockRuby.configuration.api_client}:#{ShutterstockRuby.configuration.api_secret}@#{ShutterstockRuby::API_BASE}#{path}"
    end

    def ensure_credentials!
      config = ShutterstockRuby.configuration
      fail(Exception, 'Missing credentials') if config.api_client.nil? || config.api_secret.nil?
    end
  end
end
