class Api
    @@sesame = "wGPYpFwhGgzZ0zrugkltaT88AH7pMKKg"
        
    def self.articles_list(input)
        @@url = "https://api.nytimes.com/svc/topstories/v2/#{input}.json?api-key=#{@@sesame}"
        response = HTTParty.get(@@url)
        #binding.pry
        article_attributes = {
            title1: response["results"][0]["title"], abstract1: response["results"][0]["abstract"], url1: response["results"][0]["url"],
            title2: response["results"][1]["title"], abstract2: response["results"][1]["abstract"], url2: response["results"][1]["url"],
            title3: response["results"][2]["title"], abstract3: response["results"][2]["abstract"], url3: response["results"][2]["url"],
            title4: response["results"][3]["title"], abstract4: response["results"][3]["abstract"], url4: response["results"][3]["url"],
            title5: response["results"][4]["title"], abstract5: response["results"][4]["abstract"], url5: response["results"][4]["url"]}
        Stories.new(article_attributes)
        end

end
