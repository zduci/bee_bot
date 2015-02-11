module BeeBot
  class Quote
    PREFIX = 'quote_'
    EXTENSION = '.png'

    class Invalid < StandardError; end;

    attr_reader :name, :path

    def initialize(path)
      validate_file(path)
      @path = path
      @name = extract_name
    end

    private

    def validate_file(path)
      raise Invalid unless File.exists?(path) && valid(path)
    end

    def valid(path)
      filename = File.basename(path)
      filename.start_with?(PREFIX) && filename.end_with?(EXTENSION)
    end

    def extract_name
      basename = File.basename(@path, EXTENSION)
      basename = basename.gsub(/^#{PREFIX}/, '')
      basename = basename.gsub('_', ' ')
      basename.capitalize
    end
  end
end
