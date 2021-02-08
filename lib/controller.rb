class Controller
    def start
        puts ""
        puts "Extra extra! Read all about it!"
        puts ""
        puts "Welcome to THE NEW YORK TIMES' Latest"
        puts ""
        puts "Type the section of your choice to get its most recent article"
        puts ""
        self.sections
    end        

    def sections
        sections = ["arts", "automobiles", "books", "business", "fashion", "food", "health", "home", "insider", "magazine", "movies", "nyregion", "obituaries", "opinion", "politics", "realestate", "science", "sports", "sundayreview", "technology", "theater", "t-magazine", "travel", "upshot", "us", "world"]
        sections = sections.map {|i| i.capitalize} #26 sections as parameters see: "https://developer.nytimes.com/docs/top-stories-product/1/routes/%7Bsection%7D.json/get
        puts sections
        self.choose_section
    end

    def choose_section 
        input = gets.strip
        articles = Api.articles_list(input)
        self.show_options(articles)
    end

    def show_options(articles)
        puts ""
        puts "These are the most recent articles:"
        puts "#{articles.title1}"
        puts "#{articles.title2}"
        puts "#{articles.title3}"
        puts "#{articles.title4}"
        puts "#{articles.title5}"

        

    end



    
end
