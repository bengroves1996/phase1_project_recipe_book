class Recipe_list
    attr_accessor :title,  :sourceUrl
    @@all = []

    def initialize(title,sourceUrl)
        @title = title
        @sourceUrl = sourceUrl
        @@all << self
    end

    def self.all
        @@all
    end

    def self.clear
        @@all = []
    end

    def self.display_recipes
        puts "Here's a list of recipes that will contain your ingredients!"

        value = self.all.each_with_index{|recipe,index| puts "#{index+1}. #{recipe.title}"}
        if value == []
            puts "value is empty"
        end 

    end

    def self.display_recipe(index)
        recipe = self.all[index]
        puts "#{recipe.title}"
    end 


end