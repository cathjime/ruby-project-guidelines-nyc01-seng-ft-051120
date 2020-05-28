require "tty-prompt"
require "pry"

class StoreApp 

    prompt = TTY::Prompt.new
   
    def run 
        greeting
        user_input = gets.chomp.downcase 
        if valid_user_array.include?(user_input)
        puts " "
        puts "Hi #{user_input.capitalize}! Here is the main menu: "  #present list of options
        return main_menu
        else puts "Access denied. Not a recognized user." 
        run  #- calls run again to send user back to welcome prompt 
        end
    end 

    def valid_user_array
        User.all.map do |user|
            user.name
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
            add_product 
            return_to_main       
        elsif input == 4
            add_category
            return_to_main
        elsif input == 5
            product_menu
            return_to_main
        elsif input == 6
            delete_product 
            return_to_main 
        elsif input == 7     
            storewide_discounts
            return_to_main 
        elsif input == 8
            add_a_user
            return_to_main 
        elsif input == 9
            delete_a_user
            return_to_main 
        elsif input == 10   
            puts " " 
            puts "You are now logged out. Goodbye! 👋 "
            puts " "
            return
        else 
            puts "Invalid menu option. Please enter a number between 1 - 10."
            sleep(1)
            main_menu
        end 

    end 

    def main_menu_text #prints list of menu options 
        puts " "
        puts "🧿 Main Menu: 🧿"
        puts " "
        puts "1️. View all products"
        puts "2. View products by category"
        puts "3. Add a product"
        puts "4. Add a category"
        puts "5. Update product price"
        puts "6. Delete a product"
        puts "7. Apply storewide discount"
        puts "8. Add a user"
        puts "9. Delete a user"
        puts "10. Log out" #call method that doesn't have  return value - i.e. goodbye text
        puts " "
        puts "Choose an action by entering a number." #how to incorporate error using tty prompt
        puts " "
    end 

    def view_all_products #pulls up product list 
        puts " "
        Product.all.each do |product|
        puts "🔸 #{product.name} - $#{product.price.round(2)}"
        puts "   #{product.tagline}"
        puts " "
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
                puts "🔸 #{product.name} - $#{product.price.round(2)} - #{product.tagline}"
                puts " "
            end
            puts " "
    end


    def product_menu  #prints out list of products to choose from
        y = Product.all.map do |product|
            "#{product.name}"  
        end  
        puts " "
        product_choice = TTY::Prompt.new.select("Choose a product to change price.\r\n", y)
        update_product_price(product_choice)
    end


    def update_product_price(input)
        
        chosen_product = Product.all.find do |product|
                        product.name == input
                        end
        puts " "
        puts "The current price is: $#{chosen_product.price.round(2)}. Please enter a new price. Make sure it is a number, or the price will default to $0 :"    
        new_price = gets.chomp.to_f  
        chosen_product.update(price:new_price) 
        puts " "
        puts "The price has been reset to $#{chosen_product.price.round(2)}."
        puts " "
    end

    def add_category
        puts "Type in the name of a category you would like to add."
        inputted_name = gets.chomp.capitalize
        Category.create(name:inputted_name)
        puts " "
        puts "✅ #{inputted_name} has been added as a new category"
        puts " "
    end

    def add_product
        puts " "
        puts "Let's add a new product!"
        sleep(1)
        puts " "
        puts "To start, please enter a product name:" 
        puts " "
        name_entered = gets.chomp.capitalize
        puts " "
        puts "Please enter a price for #{name_entered}. Please enter a number, or your price will default to $0 :"
        puts " "
        price_entered = gets.chomp.to_f
        puts " "
        puts "Please enter a tagline for #{name_entered}:"
        puts " "
        tagline_entered = gets.chomp
        new_product = Product.create(name: name_entered, price: price_entered, tagline: tagline_entered)
        puts " "
        puts "🎉 You've successfully added #{name_entered} to your inventory."
        puts " "

        y = Category.all.map do |category|
            "#{category.name}"
        end 

        category_choice = TTY::Prompt.new.select("Please assign it to a category below:", y)


        category_to_assign = Category.all.find do |category|
                                category.name == category_choice
                                end

        ProductCategory.create(product: new_product, category: category_to_assign)
        puts " "
        puts "✅ #{name_entered} has been added to the #{category_choice} category."
        puts " "
    end

    def delete_product

        y = Product.all.map do |product|
            "#{product.name}"  
            end  
        puts " "
        product_choice_name = TTY::Prompt.new.select("Choose a product to delete it.\r\n", y)

        # input = gets.chomp

        product_choice = Product.find_by(name: product_choice_name)

        ProductCategory.where(product: product_choice).destroy_all

        Product.where(name: product_choice_name).destroy_all

        puts " "
        puts "🗑    🗑    🗑"
        puts " "
        sleep(1)
        puts "#{product_choice_name} has been deleted from store inventory."
        puts " "
    end
   
    # private
    def greeting
        puts " "
        puts "🛍  Welcome to StoreManager! 🛍"
        sleep(0.5)
        puts " "
        # puts " 🛒"
        # puts " "
        # sleep(0.5)
        # puts " 🛒 🛒"
        # puts " "
        # sleep(0.5)
        puts "    🛒       🛒        🛒"
        puts " "
        sleep(0.5)
        puts "Please enter your username to access inventory."
        puts " "
    end 

    def storewide_discounts
        puts " "
        puts "1. 10%"
        puts "2. 25%"
        puts "3. 50%"
        puts " "
        puts "Please select 1-3 to apply the storewide discount."
        input = gets.chomp.to_i
        if input == 1
            Product.all.each do |product|           
                product.update(price: (product.price - (product.price * 0.1)).round(2))
            end
            puts " "
            puts "❗️A 10% storewide discount has been applied to your inventory.❗️"
            puts " "
        elsif input == 2
            Product.all.each do |product|           
                product.update(price: (product.price - (product.price * 0.25)).round(2))
            end 
            puts " "
            puts "❗️A 25% storewide discount has been applied to your inventory.❗️"
            puts " "
        elsif input == 3
            Product.all.each do |product|           
                product.update(price: (product.price - (product.price * 0.5)).round(2))
            end
            puts " "
            puts "❗️A 50% storewide discount has been applied to your inventory.❗️"
            puts " "
        else 
            puts "Please enter a valid discount option."
        end

        # binding.pry
    end 

    def add_a_user
        puts " "
        puts "Type in the name of the user you would like to add."
        puts " "
        inputted_name = gets.chomp.downcase
        User.create(name:inputted_name)
        puts " "
        puts "👤 #{inputted_name.capitalize} has been added as a new user and can now access inventory."
        puts " "
    end

    def delete_a_user

        y = User.all.map do |user|
            "#{user.name.capitalize}"  
            end  
        puts " "
        user_choice_name = TTY::Prompt.new.select("Choose a user to delete.\r\n", y)

        # user_choice = User.find_by(name: user_choice_name.downcase)


        User.where(name: user_choice_name.downcase).destroy_all

        puts " "
        puts "🗑    🗑    🗑"
        puts " "
        sleep(1)
        puts "#{user_choice_name} has been deleted and can no longer access inventory."
        puts " "
    end

end 