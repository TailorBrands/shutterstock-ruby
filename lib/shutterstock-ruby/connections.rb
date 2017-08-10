module ShutterstockRuby
  module Connections
    def get(path, params = nil, options = {})
      ensure_credentials!

      options = { accept: :json }.merge(options)
      options[:params] = params unless params.nil?

      RestClient.get(build_url(path), add_bearer(options))
    end

    def post(path, body, params = nil, options = {})
      ensure_credentials!

      options[:params] = params unless params.nil?
      options[:content_type] = "application/json"

      RestClient.post(build_url(path), body, add_bearer(options))
    end

    private

    def build_url(path)
      if ShutterstockRuby.configuration.access_token
        "https://#{ShutterstockRuby::API_BASE}#{path}"
      else
        "https://#{ShutterstockRuby.configuration.api_client}:#{ShutterstockRuby.configuration.api_secret}@#{ShutterstockRuby::API_BASE}#{path}"
      end
    end

    def add_bearer(options)
      options[:authorization] = "Bearer #{ShutterstockRuby.configuration.access_token}" if ShutterstockRuby.configuration.access_token
      options
    end

    def ensure_credentials!
      config = ShutterstockRuby.configuration
      fail(Exception, 'Missing credentials') if (config.api_client.nil? || config.api_secret.nil?) && config.access_token.nil?
    end
  end
end
