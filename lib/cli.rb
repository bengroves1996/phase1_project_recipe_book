require "pry"
class Cli
    def greeting
        puts "Welcome to the Modern Forager CLI Application! I'm here to help you determine what to eat!"
        puts "The instructions are quite simple, so let's get right to it!"
        puts "When asked for an input type one or two ingredients you'd like to eat tonight. Examples may be 'beef rice' or 'chicken pasta'."
        puts "From there I'll search a database of recipes for you to pick from."
        puts "What would you like to eat?"
    end

    def ask(user_input ='')
        switch = [user_input]
        string = switch.join("")
        complete = string.split(" ")
    end


end 


cli = Cli.new
cli.ask

#binding pry 
