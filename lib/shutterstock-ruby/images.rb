# frozen_string_literal: true

module ShutterstockRuby
  # A class to hold all images related code.
  class Images < Asset
    def klass_name
      'image'
    end

    def plural_klass_name
      'images'
    end

    class << self
      def klass_name
        'image'
      end

      def plural_klass_name
        'images'
      end
    end
  end
end
