module Scrapers
end

Gem.find_files('scrapers/*.rb').each { |path| require path }

