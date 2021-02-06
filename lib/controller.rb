class Controller

    

    def start
    puts ""
    puts "           Welcome to           "
    puts ""
    puts "THE NEW YORK TIMES - TOP STORIES"
    puts ""
    self.choose_section
    end

    def choose_section 
        sections = ["arts", "automobiles", "books", "business", "fashion", "food", "health", "home", "insider", "magazine", "movies", "nyregion", "obituaries", "opinion", "politics", "realestate", "science", "sports", "sundayreview", "technology", "theater", "t-magazine", "travel", "upshot", "us", "world"]
        sections = sections.map {|i| i.capitalize}
        puts "Which section would you like to view?"
        puts sections[1..5]
        
       
        input = gets.strip
        Api.articles_list(input)
    end
    
end
