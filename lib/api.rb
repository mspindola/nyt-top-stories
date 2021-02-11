class Api
    @@sesame = "wGPYpFwhGgzZ0zrugkltaT88AH7pMKKg"
        
    def self.articles_list(input)
        @@url = "https://api.nytimes.com/svc/topstories/v2/#{input}.json?api-key=#{@@sesame}"
        response = HTTParty.get(@@url)
        response["results"].map do |i|
            Stories.new({title: i["title"], abstract: i["abstract"], url: i["url"]})
        end
    end
end
