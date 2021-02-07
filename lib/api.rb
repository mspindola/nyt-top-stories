class Api
    
        @@sesame = "wGPYpFwhGgzZ0zrugkltaT88AH7pMKKg"

    def self.show_sections
        sections = ["arts", "automobiles", "books", "business", "fashion", "food", "health", "home", "insider", "magazine", "movies", "nyregion", "obituaries", "opinion", "politics", "realestate", "science", "sports", "sundayreview", "technology", "theater", "t-magazine", "travel", "upshot", "us", "world"]
        sections = sections.map {|i| i.capitalize}
    end
        
    def self.articles_list(input)
        @@url = "https://api.nytimes.com/svc/topstories/v2/#{input}.json?api-key=#{@@sesame}"
        response = HTTParty.get(@@url)
        articles_attributes = {title: response["results"][0]["title"], abstract: response["results"][0]["abstract"], url: response["results"][0]["url"]}
        binding.pry
    end  
end

# stories_list.count
    # response = stories_list.each_with_index.to_h
    # articles_attributes = {title: response["title"], abstract: response["abstract"], art_url: response["url"]}
    # stories_list = response["results"]
    # total_stories = stories_list.count
    # response = stories_list.each_with_index.to_h