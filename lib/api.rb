require_relative '../environment.rb'
require "pry"
require_relative 'book.rb'

class Api
    attr_accessor :protein,:base
    @@recipe_list = []


    def initialize(protein,base)
        @protein= protein
        @base = base
    end 

    def recipe_list
        @@recipe_list 
    end

    def clear
        @@recipe_list = []
    end 


    def fetch_recipes
        #url =   "https://api.spoonacular.com/recipes/random?number=5&tags=#{protein},#{base}/information&apiKey=692528c5936f459c841d0edc06426943"
        url =   "https://api.spoonacular.com/recipes/random?number=5&tags=#{protein},#{base}/information&apiKey=2d834e1239394ec4ad9b3035caada903"
        #"https://api.spoonacular.com/recipes/random?number=5&tags=chicken,pasta/information&apiKey=2d834e1239394ec4ad9b3035caada903"
        uri = URI(url)
        reply =  Net::HTTP.get(uri)
        recipes = JSON.parse(reply)
        recipes["recipes"][1..3] 
        
       
    end 

    def names
        place_holder = self.fetch_recipes
        if place_holder == nil
            puts  "I'm sorry I couldn't find any recipes with those parameters."
            return ""
        end
        i = 0
        title_bin = []
        sourceUrl_bin = []
        runner = (0..place_holder.length).to_a  
            for i in runner
                title_bin.append(place_holder[i-1]["title"])
                sourceUrl_bin.append(place_holder[i-1]["sourceUrl"])
            end 
            super_hash = {"Recipe Name" => title_bin,"URLS" => sourceUrl_bin}
            @@recipe_list << super_hash
            puts super_hash["Recipe Name"]
    end 

    def urls_and_names(user_input)
        i = @@recipe_list[0]["Recipe Name"].index(user_input)
        puts @@recipe_list[0]["URLS"][i]
    end
   
end 



#My api key:  692528c5936f459c841d0edc06426943
#My other api key: 2d834e1239394ec4ad9b3035caada903