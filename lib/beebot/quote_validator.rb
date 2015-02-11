module BeeBot
  class QuoteValidator
    def self.valid?(path)
      filename = File.basename(path)
      filename.start_with?(BeeBot::Quote::PREFIX) &&
        filename.end_with?(BeeBot::Quote::EXTENSION)
    end
  end
end
