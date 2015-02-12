require 'open-uri'

module BeeBot
  class DownloadImage
    def self.download(url)
      File.open("#{Dir.pwd}/quotes/images/#{File.basename(url)}", "wb") do |saved_file|
        open(url, "rb") do |read_file|
          saved_file.write(read_file.read)
        end
      end
    end
  end
end
