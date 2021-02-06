class Controller

    @sections = ["arts", "automobiles", "books", "business", "fashion", "food", "health", "home", "insider", "magazine", "movies", "nyregion", "obituaries", "opinion", "politics", "realestate", "science", "sports", "sundayreview", "technology", "theater", "t-magazine", "travel", "upshot", "us", "world"]

    def start
    puts ""
    puts "           Welcome to           "
    puts ""
    puts "THE NEW YORK TIMES - TOP STORIES"
    puts ""
    self.choose_section
    end

    def choose_section 
    puts "Which section would you like to view?"
    print @sections
    input = gets.strip
    Api.articles_list(input)

    end
    
end
