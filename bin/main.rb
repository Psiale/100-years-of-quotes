require 'open-uri'
require 'nokogiri'
require_relative '../lib/classes/nokogiri_object.rb'

short_quote = NokogiriObject.new("https://anyiko.blog/2011/10/06/12-qoutes-from-%E2%80%98100-years-of-solitude%E2%80%99/")

sqp = short_quote.nokogiri_builder(short_quote.url)
sqp.css("div#jp-post-flair").remove
p sqp.css("p").text

#  eu_url = open("https://www.europapress.es/cultura/libros-00132/noticia-cien-anos-soledad-cumple-50-anos-15-frases-imborrables-obra-gabriel-garcia-marquez-20170604115514.html").read
#  eu_path = "//div[@class='NormalTextoNoticia']/p"
#  europress = Nokogiri::HTML(eu_url)
#  arr_euro = []
#  euro_noko = europress.xpath(eu_path)
#
# euro_noko.each{ |quote|  arr_euro << quote.text}
#
# final_1 = arr_euro[5..-1]

# Frases en inglés


# Frases en español
# life_url = open("https://www.lifeder.com/frases-de-cien-anos-de-soledad/").read
# life_path = "//p/span"
# lifeder = Nokogiri::HTML(life_url)
# life_arr = []
# life_noko = lifeder.xpath(life_path)
#
# life_noko.each{ |quote| life_arr << quote.text}
# puts final = life_arr[3..-1]
