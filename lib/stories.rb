class Stories #classes need to be singular
    attr_accessor :title, :abstract, :url
      
    @@url = []
    @@titles = []
    @@abstract = []
  
    def initialize(article_attributes)
        article_attributes.each do |key, value|
            #self.class.attr_accessor(key)   This does a repeat of attr accessor
            self.send("#{key}=", value) if self.respond_to?("#{key}=")
        end
        @@titles << @title
        @@abstract << @abstract
        @@url << @url
        
    end
  
    def self.top_5_titles
        @@titles[0..5]
        #binding.pry
    end


end
