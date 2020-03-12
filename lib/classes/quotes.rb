require 'open-uri'
require 'nokogiri'
require_relative '../modules/helperable.rb'
require_relative './nokogiri_object.rb'
class Quotes
  extend Helperable
  hash_of_quotes = {}
  QUOTE_SOURCE = NokogiriObject.new('https://www.goodreads.com/work/quotes/3295655-cien-a-os-de-soledad')
  quote_results = QUOTE_SOURCE
    .nokogiri_builder(QUOTE_SOURCE.url,
                      "//div[@class ='quoteText']/text()")
  quote_validator(quote_results).each_with_index do |items, index|
    hash_of_quotes[index] = items.text
  end
  calling_quotes(hash_of_quotes)
end
