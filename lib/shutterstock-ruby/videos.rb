# frozen_string_literal: true

module ShutterstockRuby
  # A class to hold all videos related code.
  class Videos < Asset
    def klass_name
      'video'
    end

    def plural_klass_name
      'videos'
    end

    class << self
      def klass_name
        'videos'
      end

      def plural_klass_name
        'videos'
      end
    end
  end
end
