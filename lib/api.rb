class Api
    
        @@sesame = "wGPYpFwhGgzZ0zrugkltaT88AH7pMKKg"

    def self.articles_list(input)
        @@url = "https://api.nytimes.com/svc/topstories/v2/#{input}.json?api-key=#{@@sesame}"
        response = HTTParty.get(@@url)
        binding.pry
    end
end
