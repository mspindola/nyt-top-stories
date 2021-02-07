class Controller

    def start
        puts ""
        puts "Extra extra! Read all about it!"
        puts ""
        puts "Welcome to THE NEW YORK TIMES' Latest"
        puts "What's of interest today?, type the section of your choice"
        self.show_sections
    end

    def show_sections
        sections = ["arts", "automobiles", "books", "business", "fashion", "food", "health", "home", "insider", "magazine", "movies", "nyregion", "obituaries", "opinion", "politics", "realestate", "science", "sports", "sundayreview", "technology", "theater", "t-magazine", "travel", "upshot", "us", "world"]
        sections = sections.map {|i| i.capitalize} #26 sections as parameters see: url: "https://developer.nytimes.com/docs/top-stories-product/1/routes/%7Bsection%7D.json/get
        puts sections
        self.choose_section
    end

    def choose_section 
        input = gets.strip
        Api.articles_list(input)
    end


    
end
