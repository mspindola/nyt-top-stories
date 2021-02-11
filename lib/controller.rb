class Controller
    def self.start
        system("clear")
        puts ""
        puts "Extra! Extra! Read all about it!"
        puts ""
        puts "Welcome to THE NEW YORK TIMES' Latest"
        puts ""
        puts "Type a section name to get the latest articles"
        puts ""
        self.show_all_sections
    end        

    def self.show_all_sections
        @sections = ["arts", "automobiles", "books", "business", "fashion", "food", "health", "home", "insider", "magazine", "movies", "NY region", "obituaries", "opinion", "politics", "realestate", "science", "sports", "sunday review", "technology", "theater", "t-magazine", "travel", "upshot", "us", "world"]
        @sections = @sections.map {|i| i.capitalize} #26 sections as parameters see: "https://developer.nytimes.com/docs/top-stories-product/1/routes/%7Bsection%7D.json/get
        puts @sections
        self.choose_section  
    end

    def self.choose_section
        @section_input = gets.strip.capitalize

        if @sections.include?(@section_input)
            section_full = Api.articles_list(@section_input)
            self.show_options(section_full)
        else
            puts "** The entry was not recognized, please try again. **"
            self.choose_section
        end
        
    end
    
    def self.show_options(section_full)
        system("clear")
        puts ""
        puts "These are the top 5 articles of the #{@section_input} section"
        puts ""
        puts "1. #{Stories.top_5_titles[0]}"
        puts "2. #{Stories.top_5_titles[1]}"
        puts "3. #{Stories.top_5_titles[2]}"
        puts "4. #{Stories.top_5_titles[3]}"
        puts "5. #{Stories.top_5_titles[4]}"
        puts "To go to the main menu type 'menu'"

        self.selected_article(section_full)
    end

    def self.selected_article(section_full)
        puts ""
        puts "Type the number of the article you want to read:"
        article_input = gets.strip
        if article_input == "1"
            Launchy.open(Stories.url[0])
        elsif article_input == "2"
            Launchy.open(Stories.url[1])
        elsif article_input == "3"
            Launchy.open(Stories.url[2])
        elsif article_input == "4"
            Launchy.open(Stories.url[3])
        elsif article_input == "5"
            Launchy.open(Stories.url[4])
        elsif article_input == "menu"
            self.start
        elsif article_input != "1" || "2" || "3" || "4" || "5"
            system('clear')
            puts ""
            puts "** The entry was not recognized, please try again. **"
            sleep(2)
            self.show_options(section_full)    
        end
        self.post_article_options(section_full)
    end

    def self.post_article_options(section_full)
        system('clear')    
        puts ""
        puts "What would you like to do next?"
        
        puts "Type 'main' to return to main menu"
        puts "Type 'exit' to close the application"

        post_article_options_input = gets.strip
        if post_article_options_input == "main"
            self.start
        elsif post_article_options_input == "exit"
            abort "Thank you for reading - All the News That's Fit to Print."
        end
    end
end


