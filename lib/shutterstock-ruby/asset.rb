# frozen_string_literal: true

module ShutterstockRuby
  # A class to hold all asset related code.
  class Asset < Connections
    def search(query, options = {})
      JSON.parse(get("/#{plural_klass_name}/search", { query: query }.merge(options)))
    end

    def details(id, options = {})
      JSON.parse(get("/#{plural_klass_name}", { id: id }.merge(options)))
    end

    def similar(id, options = {})
      JSON.parse(get("/#{plural_klass_name}/#{id}/similar", options))
    end

    def purchase(id, subscription_id, size, options = {})
      params = { subscription_id: subscription_id, size: size }
      metadata = options.delete(:metadata) || {}

      body = { plural_klass_name => [{ "#{klass_name}_id" => id }.merge(metadata)] }.to_json
      JSON.parse(post("/#{plural_klass_name}/licenses", body, params, options))
    end

    def licenses(id, license, options = {})
      params = { "#{klass_name}_id" => id, license: license }
      JSON.parse(get("/#{plural_klass_name}/licenses", params.merge(options)))
    end

    def download(licence)
      JSON.parse(post("/#{plural_klass_name}/licenses/#{licence}/downloads", {}.to_json))
    end

    class << self
      def search(query, options = {})
        client.search(query, options)
      end

      def details(id, options = {})
        client.details(id, options)
      end

      def similar(id, options = {})
        client.similar(id, options)
      end

      def purchase(id, subscription_id, size, options = {})
        client.purchase(id, subscription_id, size, options)
      end
    end
  end
end
