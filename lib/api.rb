require_relative '../environment.rb'
require_relative 'recipe_list.rb'

class Api
    attr_accessor :protein,:base

    @@bin = []

    def initialize(protein)
        @protein= protein
    end 

    
    def fetch_recipes   
        url =  "https://api.spoonacular.com/recipes/random?number=5&tags=#{protein},/information&apiKey=#{ENV['API_KEY']}"
        uri = URI(url)
        reply =  Net::HTTP.get(uri)
        recipes = JSON.parse(reply)
        list = recipes["recipes"][1..3] 

    end 

    def create_recipes
        self.fetch_recipes{|recipe|Recipe_list.new(recipe["title"],recipe["sourceUrl"])}
    end
end 





