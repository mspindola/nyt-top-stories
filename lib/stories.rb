class Stories #classes need to be singular
    attr_accessor :title, :abstract, :url
      
    @@all = []
    
    def initialize(article_attributes) #initializes stories class
        #binding.pry
        article_attributes.each do |key, value| #iterates over the hash and its k vs 
            #self.class.attr_accessor(key)   This does a repeat of attr accessor
            self.send("#{key}=", value) if self.respond_to?("#{key}=") # send method invokes key as it is a object/class method
        end
        @@all << self
    end

    def self.all
        @@all
    end

    def self.titles_all #this gets all articles in the section and alphabetizes them
        all_titles = @@all.sort_by {|i| i.title}
    end

    def self.titles 
        titles = @@all.map {|i| i.title }
    end

    def self.link 
        urls = @@all.map {|i| i.url }
    end

    def self.clear
        @@all.clear 
    end   

end