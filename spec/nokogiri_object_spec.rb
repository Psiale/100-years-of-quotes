require_relative '../lib/classes/nokogiri_object.rb'
require_relative '../lib/modules/helperable.rb'
require 'nokogiri'
require 'open-uri'

RSpec.describe NokogiriObject do
  subject { NokogiriObject.new('https://www.microverse.org') }
  describe '#nokogiri_builder' do
    it 'prints a message and returns nil' do
      expect(subject.nokogiri_builder(subject.url)).to be_nil
    end
  end
end
