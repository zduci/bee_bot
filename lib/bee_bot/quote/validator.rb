require_relative './image'

module BeeBot
  module Quote
    class Validator
      def self.valid?(path)
        filename = File.basename(path)
        filename.start_with?(BeeBot::Quote::Image::PREFIX) &&
          filename.end_with?(BeeBot::Quote::Image::EXTENSION)
      end
    end
  end
end
