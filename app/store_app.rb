class StoreApp 
    
@@valid_user_array = ["michael", "dwight", "pam"] #should this be a class variable?
    #valid user array- array with three valid users that can be called for login, 3 predetermined users

    def run 
        #greeting
        # user_input = gets.chomp.downcase
        #if valid user_array includes?(user_input)
        #"Hi #{user_input.capitalize}! Here is the main menu: " - present list of options
        #main_menu
        #else puts "Access denied. Not a recognized user."  - calls run again to send user back to welcome prompt 
        puts "hello"
        puts "hi"
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
                            
        input = gets.chomp
        #how will tty interact with the below if/else statements?
        #is there a better or more efficient way to do this?
        if input == 1
            view_all_products 
        elsif input == 2
            view_by_category
        elsif input == 3
            add_product
        elsif input == 4
            add_category
        elsif input == 5
            update_product
        elsif input == 6  
        end 

    end 


    def view_all_products #pulls up product list - ERROR: not accessing products. connect to store? 
        Product.all.each do |product|
        "#{product.name} - #{product.price}"
        end 

    #deck chair - 3.99
    #doll - 2.99
    end 

    

   

    # def view_by_category #pulls up category list
    # end 

    # def 
    # end
   
  
    # Private
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

    def main_menu_text #prints list of menu options 
        puts "Main Menu:"
        puts "1. View all products"
        puts "2. View products by category"
        puts "3. Add a product"
        puts "4. Add a category"
        puts "5. Update a product"
        puts "6. Delete a product"
        puts "7. Log out" #how to exit program?
        puts "Choose an action by entering a number." #how to incorporate error using tty prompt
    end 

    # def goodbye_text 

    # end

end 