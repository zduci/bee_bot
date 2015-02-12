require 'tesseract'

module BeeBot
  module Quote
    class TesseractReader
      def self.read(quote)
        engine = Tesseract::Engine.new {|engine|
          engine.language  = :eng
          engine.blacklist = '|'
        }
        engine.text_for(quote.path)
      end
    end
  end
end
