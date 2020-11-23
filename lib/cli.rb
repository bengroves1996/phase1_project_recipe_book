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
            x = api.fetch_recipes
            i = 0
            i += i
            puts "#{x[i]["title"]}"
            puts "Are you happy with your choice? Yes or No?"
            ask_1 = gets.chomp
            if ask_1 == "No" || ask_1 == "no"
                puts "Would you like to try again? Yes or No?"
                ask_2 = gets.chomp
                if ask_2 == "No" || ask_2 == "no"
                    puts "I'm sorry I couldn't help you today."
                    check = false
                else 
                    puts "Would you like to try a new base? Yes or No?"
                    ask_3 = gets.chomp
                    if ask_3 == "Yes" || ask_3 == "yes"
                        puts "Okay! What would you like to try?"
                        self.display_recipes
                        index = self.first_input
                        protein = Cli.all[index]
                        api = Api.new(protein)
                    else 
                        break
                    end
                end
            elsif ask_1 == "Yes" || ask_1 == "yes"
                puts "Would you like the url for this recipe? Yes or No?"
                ask_4 = gets.chomp
                if ask_4 == "Yes" || ask_4 == "yes"
                    puts "Okay heres the recipe: #{x[i]["sourceUrl"]}"
                    check = false
                else 
                    puts "Would you like you to try again? Yes or No?"
                    ask_5 = gets.chomp
                    if ask_5 == "No" || ask_5 == "no"
                        puts "I'm sorry I couldn't help you today."
                        check = false
                    else 
                        puts "Would you like to try with the same base? Yes or No?"
                        ask_6 = gets.chomp
                        if ask_6 == "No" || ask_6 = "no"
                            puts "Okay! What would you like to try?"
                            self.display_recipes
                            index = self.first_input
                            protein = Cli.all[index]
                            api = Api.new(protein)
                        end 
                    end
                end 
            else 
                break 
            end 
        end 
        
       

    end

    def convert_input_to_index(input)
        input.to_i - 1
    end 

    def first_input
        input_first = gets.chomp
        index = convert_input_to_index(input_first)
        if index > 9 || index < 0
            puts "Invalid input. Please select a number from 1 - 4. Thank you!"
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



    
    def ask(user_input ='')
        switch = [user_input]
        string = switch.join("")
        complete = string.split(" ")
    end

    
end 


