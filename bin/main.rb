require 'open-uri'
require 'nokogiri'
require_relative '../lib/classes/nokogiri_object.rb'

# Frases en inglés 
short_quote = NokogiriObject.new("https://www.goodreads.com/work/quotes/3295655-cien-a-os-de-soledad")

sqp = short_quote.nokogiri_builder(short_quote.url,"//div[@class = 'quote']/*").text
p sqp


# Frases en español
# life_url = open("https://www.lifeder.com/frases-de-cien-anos-de-soledad/").read
# life_path = "//p/span"
# lifeder = Nokogiri::HTML(life_url)
# life_arr = []
# life_noko = lifeder.xpath(life_path)
#
# life_noko.each{ |quote| life_arr << quote.text}
# puts final = life_arr[3..-1]
