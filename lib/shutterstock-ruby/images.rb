module ShutterstockRuby
  # A class to hold all images related code.
  class Images
    extend Connections

    def self.search(query, options = {})
      query = URI.encode_www_form_component(query)
      JSON.parse(self.get('/images/search', { query: query }.merge(options)))
    end
  end
end
