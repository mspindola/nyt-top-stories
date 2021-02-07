class Controller

    def start
    puts ""
    puts "Extra extra! Read all about it!"
    puts ""
    puts "Welcome to THE NEW YORK TIMES' Latest"
    puts "What's of interest today?, type the section of your choice"
    self.choose_section
    end

    def choose_section 
        puts Api.show_sections[1..10] 
        
        input = gets.strip
        Api.articles_list(input)
    end
    
end
