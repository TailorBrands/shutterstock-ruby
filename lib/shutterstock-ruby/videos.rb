module ShutterstockRuby
  # A class to hold all videos related code.
  class Videos < Connections

    def search(query, options = {})
      JSON.parse(get('/videos/search', { query: query }.merge(options)))
    end

    def details(id, options = {})
      JSON.parse(get('/videos', { id: id }.merge(options)))
    end

    def purchase(id, subscription_id, size, options = {})
      params = { subscription_id: subscription_id, size: size }
      body = { videos: [ video_id: id ] }.to_json
      JSON.parse(post("/videos/licenses", body, params, options))
    end

    class << self
      def search(query, options = {})
        client.search(query, options)
      end

      def details(id, options = {})
        client.details(id, options)
      end

      def purchase(id, subscription_id, size, options = {})
        client.purchase(id, subscription_id, size, options)
      end
    end
  end
end
