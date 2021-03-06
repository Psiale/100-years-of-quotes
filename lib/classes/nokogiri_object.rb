require 'nokogiri'
require 'open-uri'
require_relative '../modules/helperable.rb'

# The NokogiriObject Class inherits the nokogiri library
# and creates a nokogiri object
# It also has a function for you to provide xpaths or css.selector
# a path validator that checks if the string you provided is a
# valid xpath or css.selector
class NokogiriObject
  include Helperable
  attr_reader(:url)
  def initialize(url)
    @url = url
  end

  def nokogiri_builder(url, paths = '')
    url_parsed = URI.parse(url).open
    nokogiri = Nokogiri::HTML(url_parsed)
    path_validator(nokogiri, paths)
  end
end
