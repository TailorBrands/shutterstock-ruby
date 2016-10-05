module ShutterstockRuby
  # A class to hold all videos related code.
  class Videos
    extend Connections

    def self.search(query, options = {})
      JSON.parse(self.get('/videos/search', { query: query }.merge(options)))
    end

    def self.purchase(id, subscription_id, size, options = {})
      params = { subscription_id: subscription_id, size: size }
      body = { videos: [ video_id: id ] }.to_json
      JSON.parse(self.post("/videos/licenses", body, params, options))
    end
  end
end
