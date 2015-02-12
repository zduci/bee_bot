require 'net/http'
require_relative './quote_validator'
require_relative './download_image'

module BeeBot
  class QuoteScraper
    INDEX_URL = 'http://www.thelibraryofbee.com'
    HACKY_HREF_REGEX = /src='([^']*)/
    QUOTES_DIRECTORY = './quotes/images'

    def self.scrape
      new_quotes.each do |quote|
        BeeBot::DownloadImage.download(quote)
      end
    end

    private

    def self.new_quotes
      local_quote_names = local_quotes.map do |quote|
        File.basename(quote)
      end
      quotes.reject do |quote|
        local_quote_names.include?(File.basename(quote))
      end
    end

    def self.quotes
      image_urls.select { |url| BeeBot::QuoteValidator.valid?(url) }
    end

    def self.image_urls
      html = Net::HTTP.get(URI.parse(INDEX_URL))
      html.scan(HACKY_HREF_REGEX).flatten
    end

    def self.local_quotes
      Dir.glob("#{QUOTES_DIRECTORY}/**/*")
    end
  end
end
