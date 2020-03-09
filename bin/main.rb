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

calling_quotes(hash_of_quotes)
