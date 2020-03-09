require 'open-uri'
require 'nokogiri'
require_relative '../lib/modules/helperable.rb'
require_relative '../lib/classes/nokogiri_object.rb'
include Helperable

# Frases en inglés
quote_source = NokogiriObject.new("https://www.goodreads.com/work/quotes/3295655-cien-a-os-de-soledad")

quote_results = quote_source.nokogiri_builder(quote_source.url, "//div[@class ='quoteText']/text()")
hash_of_quotes = {}

quote_validator(quote_results).each_with_index { |item, index|
  hash_of_quotes[index] = item
}

# puts hash_of_quotes.values
puts hash_of_quotes[6]

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
