require 'nokogiri'
require 'open-uri'
require_relative '../modules/helperable.rb'
class NokogiriObject
    include Helperable
        attr_accessor(:url)
        def initialize(url)
            @url = url
        end
def nokogiri_builder(url,paths = "")
    url_parsed = URI.parse(url)
    nokogiri = Nokogiri::HTML("#{open(url_parsed).read}")
    nokogiri_path = path_validator(nokogiri, paths)
end

def path_validator(nokogiri_object, paths)
    if !paths.empty?
        case paths
        when paths.include?("/")
         nokogiri_object.xpath(paths)
        else
            nokogiri_object.css(paths)
        end
        
    else
        nokogiri_object
        end
    end
end

#avatar = Nokogiri_object.new("https://avatarteam.es.tl/FRASES-CELEBRES-DE-LA-SERIE.htm").nokogiri_builder(,"//p")
#arr_avatar = [] 
#
# avatar.split(" ").each{ |element| arr_avatar << element}
## avatar.each{ |quote| quote # arr_avatar << quote.text.split(" ")}
#
# 8.times do |i|
#    i = 0
#    # puts arr_avatar[i]
#    arr_avatar.delete_at(i)
#    # puts arr_avatar
# end
#
#arr_avatar.join(" ")