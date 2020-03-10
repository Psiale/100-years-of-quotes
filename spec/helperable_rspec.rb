require_relative '../lib/modules/helperable.rb'
require 'nokogiri'
require 'open-uri'

RSpec.describe Helperable do
  let(:dummy_class) { Class.new { extend Helperable } }
  let(:url) { 'https://www.microverse.org' }
  let(:nokogiri) { Nokogiri::HTML(open(url).read) }
  let(:hash_for_testing) { { '1' => 'Hello' } }

  describe '#path_validator' do
    it "prints a message a returns nil if
        you don't provide a valid path" do
      expect(dummy_class.path_validator(nokogiri, '')).to be_nil
    end
    it 'returns a Nokogiri::XML::NodeSet object if you pass a valid css path' do
      expect(dummy_class.path_validator(nokogiri, 'div'))
        .to be_an Nokogiri::XML::NodeSet
    end
    it 'returns a Nokogiri::XML::NodeSet object
    if you pass a valid xpath path' do
      expect(dummy_class.path_validator(nokogiri, '//div'))
        .to be_an Nokogiri::XML::NodeSet
    end
    describe '#quote_validator' do
      it "checks for the quote to include \“ and returns and array with only
          those values" do
        expect(dummy_class
            .quote_validator(dummy_class.path_validator(nokogiri, '//div'))
            .class).to eql Array
      end
    end
    describe '#greetings' do
      it 'puts a welcome message and the options
      to use the program and returns nil' do
        expect(dummy_class.greetings).to be_nil
      end
    end
    describe '#user_options_to_get_quotes' do
      it 'puts a quote or not depending on the
      input from the user and then exits the program' do
        expect(dummy_class.user_options_to_get_quotes('a', hash_for_testing))
          .to be_nil
      end
    end
  end
end
