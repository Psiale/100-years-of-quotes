module Helperable
  def path_validator(nokogiri_object, paths)
    if !paths.empty?
      case paths
      when paths.include?('/')
        nokogiri_object.xpath(paths).text
      else
        nokogiri_object.css(paths).text
      end

    else
      puts 'Invalid format please use a xpath or a css selector path'
    end
  end

  def quote_validator(nokogiri_with_path)
    arr_of_quotes = []
    nokogiri_with_path.each do |quote|
      if quote.text.include? "\“"

        arr_of_quotes << "#{quote.text} \n  Gabriel Garcia Marquez - One Hundred Years Of Solitude "
      end
    end
    arr_of_quotes
   end
end
