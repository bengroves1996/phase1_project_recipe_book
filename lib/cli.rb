require "pry"
class Cli
    @@all = ["chicken","pasta","beef","pork","fish","rice","chocolate","beans"]

    def self.all
        @@all
    end 

    def display_recipes
        Cli.all.each_with_index{|ingredient, index| puts "#{index+1}. #{ingredient}"}
    end 

    def greeting
        puts "Welcome to the Modern Forager CLI Application! I'm here to help you determine what to eat!"
        puts "The instructions are quite simple, so let's get right to it!"
        puts "When asked for an input type one or two ingredients you'd like to eat tonight. Examples may be 'beef rice' or 'chicken pasta'."
        puts "From there I'll search a database of recipes for you to pick from."
        puts "What would you like to eat?"
        self.display_recipes
        index = self.first_input
        protein = Cli.all[index]
        api = Api.new(protein)
        check = true
        while check == true
            populate = api.fetch_recipes
            self.display_and_choose
            puts "Would you like another recipe? Yes or No?"
            input_fifth = gets.chomp 
            if input_fifth == "No" || input_fifth == "no"
                puts "Thank you for your time today."
                check = false
            end 
        end 
    end

    def convert_input_to_index(input)
        input.to_i - 1
    end 

    def first_input
        x = @@all.length
        input_first = gets.chomp
        index = convert_input_to_index(input_first)
        if index > x-1 || index < 0
            puts "Invalid input. Please select a number from 1 - #{x}. Thank you!"
            self.first_input
        else
            index
        end 
    end 

    def second_input
        input_second = gets.chomp
        puts "Are you happy with your pick? 1: Yes or 2: No?"
        if input_second == "2" || input_second == "2"
            puts "Would you like to restart, and try again? 1: Yes or 2: No?"
            input_third = gets.chomp
            if input_third == "2" || input_third == "2"
                puts "I'm sorry to hear that! Goodbye!"
                return ""
            else
                self.first_input
            end
        end
    end

    def display_and_choose
        Recipe_list.display_recipes
        puts "Which suggestion do you like?"
        input_fourth = gets.chomp
        index = convert_input_to_index(input_fourth)
        if index > Recipe_list.all.length - 1 || index < 0
            puts 'Invalid Input'
            self.display_and_choose
        else 
            recipe_object = Recipe_list.all[index]
            puts "#{recipe_object.sourceUrl}"
            Recipe_list.clear
        end 


    end



    
    def ask(user_input ='')
        switch = [user_input]
        string = switch.join("")
        complete = string.split(" ")
    end

    
end 

## Compress if/else statements

