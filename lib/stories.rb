class Stories
    attr_accessor :title, :abstract, :url
      
    @@all = []
  
    def initialize(article_attributes)
        article_attributes.each do |key, value|
            self.class.attr_accessor(key)
            self.send("#{key}=", value) if self.respond_to?("#{key}=")
        end
        @@all << self
        #binding.pry
    end
  
    def self.all
      @@all
    end

   



end
