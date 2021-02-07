class Api
    
        @@sesame = "wGPYpFwhGgzZ0zrugkltaT88AH7pMKKg"


        
    def self.articles_list(input)
        @@url = "https://api.nytimes.com/svc/topstories/v2/#{input}.json?api-key=#{@@sesame}"
        response = HTTParty.get(@@url)
        article_attributes = {title: response["results"][0]["title"], abstract: response["results"][0]["abstract"], url: response["results"][0]["url"]}
        Stories.new(article_attributes)
    end  
end

# stories_list.count
    # response = stories_list.each_with_index.to_h
    # articles_attributes = {title: response["title"], abstract: response["abstract"], art_url: response["url"]}
    # stories_list = response["results"]
    # total_stories = stories_list.count
    # response = stories_list.each_with_index.to_h