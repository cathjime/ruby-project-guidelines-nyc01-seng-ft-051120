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
        main_menu_text     

        input = gets.chomp.to_i
    
        if input == 1
            view_all_products
            return_to_main
        elsif input == 2
            view_by_category
            return_to_main
        elsif input == 3
            add_product        #ERROR not recognizing category/name
        elsif input == 4
            add_category
            return_to_main
        elsif input == 5
            product_menu
            update_product_price        #ERROR not recognizing price
            return_to_main
        elsif input == 6
            delete_product          #ERROR undefined method `destroy_by'
        elsif input == 7    #HOW WOULD WE EXIT APP?
            puts "You are now logged out. Goodbye! 👋 "
            run
        else 
            puts "Invalid menu option. Please enter a number between 1 - 7."
            sleep(1)
            main_menu
        end 

    end 

    def main_menu_text #prints list of menu options 
        puts " "
        puts "Main Menu:"
        puts "1️. View all products"
        puts "2. View products by category"
        puts "3. Add a product"
        puts "4. Add a category"
        puts "5. Update product price"
        puts "6. Delete a product"
        puts "7. Log out" #call method that doesn't have  return value - i.e. goodbye text
        puts " "
        puts "Choose an action by entering a number." #how to incorporate error using tty prompt
        puts " "
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
            "#{category.name}"
        end 
        
        category_choice = TTY::Prompt.new.select("Choose a category to view products.", y)
        display_products_by_category(category_choice)
    end 


    def display_products_by_category(category_choice)   #ERROR - products is undefined
            chosen = Category.all.find do |category|
                    category.name == category_choice
                    end
                    puts " "
            chosen.products.each do |product|
                puts "🔹 #{product.name} - #{product.price}"
            end
            puts " "
    end


    def product_menu  #prints out list of products to choose from
        y = Product.all.map do |product|
            "🔹 #{product.name}"  
        end  
        puts " "
        TTY::Prompt.new.select("Choose a product to change price.\r\n", y)
    end


    def update_product_price
        product_choice = gets.chomp
    
        chosen_product = Product.all.find do |product|
                        product.name == product_choice
                        end
        binding.pry
        puts "The current price is: $#{chosen_product.price}. Please enter a new price."      
        product.update(price:new_price) #update price = new price
        puts "The price has been reset to $#{chosen_product.price}."
    end

    def add_category
        puts "Type in the name of a category you would like to add."
        inputted_name = gets.chomp.capitalize
        Category.create(name:inputted_name)
        puts "#{inputted_name} has been added as a new category"
    end

    def add_product
        puts " "
        puts "Let's add a new product!"
        sleep(1)
        puts " "
        puts "To start, please enter a product name:" 
        puts " "
        name_entered = gets.chomp
        puts " "
        puts "Please enter a price for #{name_entered}:"
        puts " "
        price_entered = gets.chomp.to_f
        puts " "
        puts "Please enter a tagline for #{name_entered}:"
        puts " "
        tagline_entered = gets.chomp
        new_product = Product.create(name: name_entered, price: price_entered, tagline: tagline_entered)
        puts " "
        puts "You've successfully added #{name_entered} to your inventory."
        puts " "

        y = Category.all.map do |category|
            "🔸#{category.name}"
        end 

        category_choice = TTY::Prompt.new.select("Please assign it to a category below:", y)


        category_to_assign = Category.all.find do |category|
            category.name == category_choice
            end

        ProductCategory.create(product: new_product, category: category_to_assign)
    end

    def delete_product

        y = Product.all.map do |product|
            "🔹 #{product.name}"  
            end  
        puts " "
        TTY::Prompt.new.select("Choose a product to delete it.\r\n", y)

        product_choice_name = gets.chomp

        product_choice = Product.find_by(name: product_choice_name)
        ProductCategory.destroy_by(product: product_choice)

        Product.destroy_by(name: product_choice_name)
        puts " "
        puts "🗑"
        puts " "
        sleep(1)
        puts "#{product_choice_name} has been deleted from store inventory."
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