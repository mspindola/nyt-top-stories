class Stories #classes need to be singular
    attr_accessor :title, :abstract, :url
      
    @@url = []
    @@titles = []
    @@abstract = []
  
    def initialize(article_attributes) #initializes stories class
        #binding.pry
        article_attributes.each do |key, value| #iterates over the hash and its k vs 
            #self.class.attr_accessor(key)   This does a repeat of attr accessor
            self.send("#{key}=", value) if self.respond_to?("#{key}=") # send method invokes key as it is a object/class method
        end
        @@titles << @title #shovels
        @@abstract << @abstract #shovels
        @@url << @url #shovels
        #binding.pry
    end
  
    def self.top_5_titles #defines class method
        @@titles[0..4] #calls out range in array of titles
    end

    def self.link #defines class method 
        @@url[0..4] #calls out range in array of links
    end

    def self.clear #clears array for new section
        @@url.clear 
        @@titles.clear
        @@abstract.clear
    end


end
