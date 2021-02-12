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
        sections = ["arts", "automobiles", "books", "business", "fashion", "food", "health", "insider", "magazine", "movies", "obituaries", "opinion", "politics", "realestate", "science", "sports", "sunday review", "technology", "theater", "t-magazine", "travel", "upshot", "us", "world"]
        sections = sections.map {|i| i.capitalize} 
        puts sections
        @section_input = gets.strip.capitalize
        if sections.include?(@section_input)
            section_full = Api.new.articles_list(@section_input)
            self.show_options(section_full)
        # elsif @section_input == "exit"
        #     puts "Thank you for reading - All the News That's Fit to Print."
        #     abort
        else
            puts "** The entry was not recognized, please try again. **"
            self.show_all_sections
            
        end        
    end
    
    def self.show_options(section_full)
        system("clear")
        puts ""
        puts "These are the top 5 articles of the #{@section_input} section."
        puts "For an alphabetized list of articles of this section type 'all'."
        puts ""
        puts "1. #{Stories.titles[0]}"
        puts "2. #{Stories.titles[1]}"
        puts "3. #{Stories.titles[2]}"
        puts "4. #{Stories.titles[3]}"
        puts "5. #{Stories.titles[4]}"
        puts ""
        puts "To go to the main menu type 'menu' or 'exit' to close the application"
        
        self.selected_article(section_full)
    end

    def self.selected_article(section_full)
        puts ""
        puts "Type the number of the article you want to read:"
        article_input = gets.strip
        if article_input == "1"
            Launchy.open(Stories.link[0])
        elsif article_input == "2"
            Launchy.open(Stories.link[1])
        elsif article_input == "3"
            Launchy.open(Stories.link[2])
        elsif article_input == "4"
            Launchy.open(Stories.link[3])
        elsif article_input == "5"
            Launchy.open(Stories.link[4])
        elsif article_input == "all"
            self.pull_article_from_all(section_full)
        elsif article_input == "menu"
            Stories.clear && self.start
        elsif article_input == "exit"
            abort "Thank you for reading - All the News That's Fit to Print."
        elsif article_input != "1" || "2" || "3" || "4" || "5" #|| "all"
            system('clear')
            puts ""
            puts "** The entry was not recognized, please try again. **"
            sleep(2)
            self.show_options(section_full)    
        end
        self.post_article_options(section_full)
    end

    def self.post_article_options(section_full)
        #system('clear')    
        puts ""
        puts "What would you like to do next?"
        
        puts "Type 'main' to return to main menu"
        puts "Type 'exit' to close the application"

        post_article_options_input = gets.strip
        if post_article_options_input == "main"
            Stories.clear && self.start
        elsif post_article_options_input == "exit"
            abort "Thank you for reading - All the News That's Fit to Print."
        else
            puts "** The entry was not recognized, please try again. **"
            sleep(2) 
            self.post_article_options(section_full)
        end
    end

    def self.all_section_articles(section_full)
        puts "#{Stories.all_by_alpha_order}"
        puts ""
        puts "What would you like to do next?"
        
        puts "Type 'main' to return to main menu"
        puts "Type 'exit' to close the application"

        post_article_options_input = gets.strip
        if post_article_options_input == "main"
            Stories.clear && self.start
        elsif post_article_options_input == "exit"
            abort "Thank you for reading - All the News That's Fit to Print."
        else
            puts "** The entry was not recognized, please try again. **"
            sleep(2) 
            self.post_article_options(section_full)
        end
    end

    def self.pull_article_from_all(section_full)
        puts "These are the current stories in the #{@section_input} section."       
        Stories.titles_all.each.with_index(1) do |x ,i|
            puts "#{i}. #{x.title}"
        end
        puts "Enter the number of the article you want to read:"
        input = gets.strip.to_i-1  
        Launchy.open(Stories.titles_all[input].url)
    end
end


