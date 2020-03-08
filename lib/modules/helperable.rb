module Helperable
    def path_validator(nokogiri_object, paths)
        if !paths.empty?
            case paths
            when paths.include?("/")
             nokogiri_object.xpath(paths).text
            else
                nokogiri_object.css(paths).text
            end
            
        else
            puts noo!
        end
    end
end