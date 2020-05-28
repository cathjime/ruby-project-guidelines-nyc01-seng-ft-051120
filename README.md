# StoreManager 
 - A tool for store inventory management, created by Catherine Jimenez and Chaya Greisman. 


# Install Instructions
- To use this app, first fork and clone this repo. Then navigate to the directory, run 'bundle install', then run 'ruby bin/run.rb'.


# Description
StoreManager is an app for managing inventory. It can be used by anyone who has a username stored in the database, whether owner, manager, or other employees. We created this app with some existing users, products, and categories in the database. Once a user has successfully signed in, they have access to various inventory tasks including adding, updating, accessing, and deleting inventory data, as well as adding or deleting other users. 

# Contributors Guide



# User Stories
- [ ] As a user, I should be able to log in to my app with the correct username.
- [ ] As a user, I should be able to view all the products in my inventory.
- [ ] As a user, I should be able to view products by category.
- [ ] As a user, I should be able to add a new product to the inventory list.
- [ ] As a user, I should be able to add a new category option.
- [ ] As a user, I should be able to remove a product from my inventory.
- [ ] As a user, I should be able to apply discounts to my store.
- [ ] As a user, I should be able to add a new user.
- [ ] As a user, I should be able to delete a user. 
- [ ] As a user, I should be able to log out.








 # Presentation


- Address, if anything, what you would change or add to what you have today?

  * We could have optimized our app to make it usable for more than just one store. This would involve making a table of stores, in addition to the existing tables.
  A store would have many users and a user would belong to a store.
  A store would also have many products, and a product would belong to a store.
  A store would have many categories through its products.

  * We also could have used an api to load our app with products or users.


- Present any code you would like to highlight:

  * delete_product method
      + We needed to delete both the product, as well as its category associations on the Product-Category join table.
      + We figured out that we had to delete the association before deleting the actual product, as we needed that product row   and its primary id to be available for locating its associations to any category.
      + This was especially important, given that in our model, a product can have many categories.
      + We used the TTY::Prompt gem here (and in some other methods) to display and allow choices in manner that was more user-friendly
      + A challenge was understanding the general usage of TTY::Prompt, and it was a process to learn that it provides methods which have return values, what those return values were, and storing those return values in variables that we could use.
  * add_product method
      + This method contains many aspects similar to our delete_product method
      + In adding a product, we needed to capture a user's inputted values for the product attributes

- Discuss 3 things you learned in the process of working on this project.

    * That 'gets.chomp' (or gets.strip, etc) tells the computer to expect a user input. 
    For instance, 'input = gets.chomp' expects an input from the user and saves that input in a variable 'input'.
    While using TTY::Prompt to pull up a list of choices, we did not realize that the method we were using both displays choices and returns the choice (ie; using TTY::Prompt, selecting a category from the list would return "Category").
    Our flawed understanding of both gets.chomp and TTY::Prompt led us to try to store the choice value as gets.chomp

    * Navigating through issues like the above improved our debugging skills, specifically in using Pry within our app.
    When attempting to use pry, we were confused as to why we were not hitting it immediately and entering into a pry console session. By the end of our project, we came to understand that running our file with a 'binding.pry' at some point inside it will run all working code first up until hitting 'binding.pry'.

    * Broadening our understanding of variable scope. In our product_menu method, we captured a value of a product choice as a variable. We then needed to pass it to our update_product_price method. To give the update_product_price method access to a variable that was defined in the previous method (product_menu), we had to actually call update_product_price within product_menu and give it an argument of the variable defined in product_menu.

    
   
    
    
    

!!!!!  link to youtube vid !!!

 ©️ Catherine Jimenez & Chaya Greisman