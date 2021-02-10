class Controller
    def self.start
        system("clear")
        puts ""
        puts "Extra! Extra! Read about it!"
        puts ""
        puts "Welcome to THE NEW YORK TIMES' Latest"
        puts ""
        puts "Type a section name to get the latest articles"
        puts ""
        puts sections
        self.choose_section
    end        

    def self.choose_section
        sections = ["arts", "automobiles", "books", "business", "fashion", "food", "health", "home", "insider", "magazine", "movies", "nyregion", "obituaries", "opinion", "politics", "realestate", "science", "sports", "sundayreview", "technology", "theater", "t-magazine", "travel", "upshot", "us", "world"]
        sections = sections.map {|i| i.capitalize} #26 sections as parameters see: "https://developer.nytimes.com/docs/top-stories-product/1/routes/%7Bsection%7D.json/get
        section_input = gets.strip
    end
    
    def self.show_options(articles)
        puts ""
        puts "These are the most recent articles:"
        puts ""
        puts "1. #{articles.title1}"
        puts "2. #{articles.title2}"
        puts "3. #{articles.title3}"
        puts "4. #{articles.title4}"
        puts "5. #{articles.title5}"
        puts ""
        puts "Type the number of the article to read the article:"
        self.selected_article(articles)
    end

    def self.selected_article(articles)
        article_input = gets.strip
        if article_input == "1"
            Launchy.open(articles.url1)
        elsif article_input == "2"
            Launchy.open(articles.url2)
        elsif article_input == "3"
            Launchy.open(articles.url3)
        elsif article_input == "4"
            Launchy.open(articles.url4)
        elsif article_input == "5"
            Launchy.open(articles.url5)
        elsif article_input != "1" || "2" || "3" || "4" || "5"
            puts "The entry was not recognized, please try again."
            self.show_options(articles)
        end
        self.post_article_options(articles)
    end

    def self.post_article_options(articles)
        
        puts "What would you like to do next?"
        puts "Type:"
        puts "main to return to main menu"
        puts "bye to close the application"

        post_article_options_input = gets.strip
        if post_article_options_input == "main"
            self.start
        elsif post_article_options_input == "bye"
            abort "Thank you for reading - All the News That's Fit to Print."
        end
    end

end


