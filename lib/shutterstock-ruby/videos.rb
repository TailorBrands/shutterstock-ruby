module ShutterstockRuby
  # A class to hold all videos related code.
  class Videos
    extend Connections

    def self.search(query, options = {})
      query = URI.encode_www_form_component(query)
      JSON.parse(self.get('/videos/search', { query: query }.merge(options)))
    end
  end
end
