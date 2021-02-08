class Controller
    def start
        system("clear")
        puts ""
        puts "Abstract Abstract! Read about it!"
        puts ""
        puts "Welcome to THE NEW YORK TIMES' Latest"
        puts ""
        puts "Type a section to get the latest articles"
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
        section_input = gets.strip
        articles = Api.articles_list(section_input)
        self.show_options(articles)
    end

    def show_options(articles)
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

    def selected_article(articles)
        article_input = gets.strip
        if article_input == "1"
            puts ""
            Launchy.open(articles.url1)
            puts ""
        elsif article_input == "2"
            puts ""
            Launchy.open(articles.url2)
            puts ""
        elsif article_input == "3"
            puts ""
            Launchy.open(articles.url3)
            puts ""
        elsif article_input == "4"
            puts ""
            Launchy.open(articles.url4)
            puts ""
        elsif article_input == "5"
            puts ""
            Launchy.open(articles.url5)
            puts ""
        elsif article_input != "1" || "2" || "3" || "4" || "5"
            puts "The entry was not recognized, please try again."
            self.show_options(articles)
        end
        #self.article_options(articles)
    end

    # def article_options(articles)
    #     puts "Do you want to read the full article? 
    #     Type:
    #     'yes' to continue
    #     'main' to return to main menu
    #     'bye' to close the application"
    #     article_options_input = gets.strip
    #     if article_options_input == "yes" || "y"
    #         Launchy.open(articles.url"#{article_options_input}")
    #     elsif article_options_input == "main"
    #         self.start
    #     elsif article_options_input == "bye bye"
    #         abort "Thank you for reading
    #         All the News That's Fit to Print"
    #     else
    #         puts "The entry was not recognized, please try again."
    #     end
    # end
end


