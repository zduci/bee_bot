require_relative './validator'

module BeeBot
  module Quote
    class Image
      PREFIX = 'quote_'
      EXTENSION = '.png'

      class Invalid < StandardError; end;

      attr_reader :name, :path

      def initialize(path, name)
        @path = path
        @name = name
      end

      def self.from_path(path)
        validate_file(path)
        new(path, extract_name(path))
      end

      private

      def self.validate_file(path)
        raise Invalid unless File.exists?(path) &&
          BeeBot::Quote::Validator.valid?(path)
      end

      def self.extract_name(path)
        basename = File.basename(path, EXTENSION)
        basename = basename.gsub(/^#{PREFIX}/, '')
        basename = basename.gsub('_', ' ')
        basename.capitalize
      end
    end
  end
end
