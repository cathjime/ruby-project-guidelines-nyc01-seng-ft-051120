require "tty-prompt"
require "pry"

class StoreApp 

    prompt = TTY::Prompt.new
   
    @@valid_user_array = ["michael", "dwight", "pam"] #should this be a class variable? #create method for this

    def run 
        greeting
        user_input = gets.chomp.downcase
        if @@valid_user_array.include?(user_input)
        puts "Hi #{user_input.capitalize}! Here is the main menu: "  #present list of options
        return main_menu
        else puts "Access denied. Not a recognized user."  #- calls run again to send user back to welcome prompt 
        end
    end 

    def product_price_menu
        y = Product.all.map do |product|
            "🔹 #{product.name}"  
        end  
        TTY::Prompt.new.select("Choose a product to change price.", y)
    end

    def update_product_price
        product_choice = gets.chomp

        chosen_product = Product.all.find do |product|
                        product.name == product_choice
                        end
        puts "The current price is: $#{chosen_product.price}. Please enter a new price."      
        product.update(price:new_price) #update price = new price
        puts "The price has been reset to $#{chosen_product.price}."
    end


    def return_to_main
        puts "Type 'r' to return to main menu."
        input = gets.chomp
        if input == "r"
        main_menu
        else 
        puts "Sorry, we didn't recognize that command."
        return_to_main
        end 
    end 

    def main_menu   
        main_menu_text     #do we need to call this on an instance?
                            
        input = gets.chomp.to_i
        # binding.pry
        #how will tty interact with the below if/else statements?
        #is there a better or more efficient way to do this?
        if input == 1
            view_all_products
            return_to_main
        elsif input == 2
            view_by_category
            display_products_by_category    #ERROR not recognizing products
            return_to_main
        elsif input == 3
            add_product
        elsif input == 4
            add_category
        elsif input == 5
            product_price_menu
            update_product_price        #ERROR not recognizing price
            return_to_main
        elsif input == 6
            delete_product
        elsif input == 7    #HOW WOULD WE EXIT APP?
            #exit app
            puts "You are now logged out. Goodbye! 👋 "
        else 
            puts "Invalid menu option. Please enter a number between 1 - 7."
            main_menu
        end 

    end 

    def main_menu_text #prints list of menu options 
        puts "Main Menu:"
        puts "1. View all products"
        puts "2. View products by category"
        puts "3. Add a product"
        puts "4. Add a category"
        puts "5. Update product price"
        puts "6. Delete a product"
        puts "7. Log out" #call method that doesn't have  return value - i.e. goodbye text
        puts "Choose an action by entering a number." #how to incorporate error using tty prompt
    end 


    def view_all_products #pulls up product list 
        puts " "
        Product.all.each do |product|
        puts "🔹 #{product.name} - $#{product.price}"
        end 
        puts " "
    end 
    
    def view_by_category #pulls up category list
        y = Category.all.map do |category|
            "🔸 #{category.name}"
        end 
        
        TTY::Prompt.new.select("Choose a category to view products.", y)
    end 


    def display_products_by_category   #ERROR - products is undefined
        category_choice = gets.chomp
            chosen = Category.all.find do |category|
                    category.name == category_choice
                    end
                    puts " "
            chosen.products.each do |product|
                puts "🔹 #{product.name} - #{product.price}"
            end
            puts " "
    end

   
    # private
    def greeting
        puts " "
        puts "Welcome to StoreManager! 🛍"
        sleep(0.5)
        puts " "
        puts " 🛒"
        puts " "
        sleep(0.5)
        puts " 🛒 🛒"
        puts " "
        sleep(0.5)
        puts " 🛒 🛒 🛒"
        puts " "
        sleep(0.5)
        puts "Please enter your username to access inventory."
        puts " "
    end 


end 