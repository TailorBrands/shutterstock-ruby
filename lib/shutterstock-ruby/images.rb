module ShutterstockRuby
  # A class to hold all images related code.
  class Images < Connections

    def search(query, options = {})
      JSON.parse(get('/images/search', { query: query }.merge(options)))
    end

    class << self
      def search(query, options = {})
        client.search(query, options)
      end
    end
  end
end
