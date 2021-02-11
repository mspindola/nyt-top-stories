class Api 
    @@sesame = "wGPYpFwhGgzZ0zrugkltaT88AH7pMKKg" #Provides api key 
        
    def articles_list(input) # defines instance method
        url = "https://api.nytimes.com/svc/topstories/v2/#{input}.json?api-key=#{@@sesame}" #sets url value to api url and interpolates key and input to look for in sections
        response = HTTParty.get(url) #defines response variable with HTTParty to use get method and retrieves data
        response["results"].map do |i| #map is used in the response variable, accessing the results hash and bringing data over to instantiate our Stories class looks for:
            Stories.new({title: i["title"], abstract: i["abstract"], url: i["url"]}) #Stories is isntantiated with title abstract and url attributes accessing them in the returned hash. 
        end
    end
end
