class Product < ActiveRecord::Base
    has_many :product_categories
    has_many :categories, through: :product_categories

    # def self.view_all_products #pulls up product list - ERROR: not accessing products. connect to store? 
    #     Product.all.each do |product|
    #     "#{product.name} - #{product.price}"
    #     end 
    # end 

    def all_products
        Product.all
    end 

end