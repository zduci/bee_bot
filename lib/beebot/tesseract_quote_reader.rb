require 'tesseract'

module BeeBot
  class TesseractQuoteReader
    def self.read(quote)
      engine = Tesseract::Engine.new {|engine|
        engine.language  = :eng
        engine.blacklist = '|'
      }
      engine.text_for(quote.path)
    end
  end
end
