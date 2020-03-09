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

        arr_of_quotes << "#{quote.text} \n
          Gabriel Garcia Marquez - One Hundred Years Of Solitude \n 
          ------------------------------------------------------"
      end
    end
    arr_of_quotes
   end

   def greetings
    puts "Hello, I'm here to provide you with 100 years of solitud quotes"
    puts 'Options to get (a) quote(s)'
    puts "rand = will get you a random quote \n
          top = will get you the top 10 quotes of our list \n
          all = will get you all the quotes"
end

def calling_quotes(hash_of_quotes)
    greetings
    puts 'Put something: '
    quote_option = gets.chomp
    case quote_option.downcase
    when 'rand'
        puts hash_of_quotes[rand(0..hash_of_quotes.length-1)]
    when 'top'
        hash_of_quotes.values[0..9].each_with_index do |value,index|
            puts "#{index+1}. \n \n #{value.strip}"
            puts "\n"
        end
    when 'all'
        puts hash_of_quotes.values
    end
end

end
