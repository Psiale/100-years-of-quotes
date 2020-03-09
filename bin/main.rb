require 'open-uri'
require 'nokogiri'
require_relative '../lib/modules/helperable.rb'
require_relative '../lib/classes/nokogiri_object.rb'
include Helperable
hash_of_quotes = {}


# Frases en inglés
QUOTE_SOURCE = NokogiriObject.new("https://www.goodreads.com/work/quotes/3295655-cien-a-os-de-soledad")

quote_results = QUOTE_SOURCE.nokogiri_builder(QUOTE_SOURCE.url, "//div[@class ='quoteText']/text()")

quote_validator(quote_results).each_with_index { |item, index|
  hash_of_quotes[index] = item
}

# puts hash_of_quotes.values
calling_quotes(hash_of_quotes)

# so far I have the quotes now I have to join some of them
# I fucking hate this shit
# Frases en español
# life_url = open("https://www.lifeder.com/frases-de-cien-anos-de-soledad/").read
# life_path = "//p/span"
# lifeder = Nokogiri::HTML(life_url)
# life_arr = []
# life_noko = lifeder.xpath(life_path)
#
# life_noko.each{ |quote| life_arr << quote.text}
# puts final = life_arr[3..-1]
