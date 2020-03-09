require 'open-uri'
require 'nokogiri'
require_relative '../lib/classes/nokogiri_object.rb'

# Frases en inglés 
short_quote = NokogiriObject.new("https://www.litcharts.com/lit/one-hundred-years-of-solitude/quotes")

sqp = short_quote.nokogiri_builder(short_quote.url,"//p[@class='quote-text']")
arr_of_short_quotes = []
hash_of_quotes = { }

 sqp.each do |quote|
    arr_of_short_quotes << quote.text.gsub(/ \Wu201\w([\W])* /," ")
 end

 arr_of_short_quotes.each_with_index { |item, index|
    hash_of_quotes[index] = item  }

 puts hash_of_quotes.values

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
