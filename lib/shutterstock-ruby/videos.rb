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
      metadata = options.delete(:metadata) || {}

      body = { videos: [ { video_id: id }.merge(metadata)] }.to_json
      JSON.parse(post("/videos/licenses", body, params, options))
    end

    def licenses(video_id, license, options = {})
      params = { video_id: video_id, license: license }
      JSON.parse(get("/videos/licenses", params.merge(options)))
    end

    def download(licence)
      JSON.parse(post("/videos/licenses/#{licence}/downloads", {}.to_json))
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
