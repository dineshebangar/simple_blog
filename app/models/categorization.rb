class Categorization < ActiveRecord::Base
  # attr_accessible :title, :body
  set_table_name ("categories_posts")
  belongs_to :category
  belongs_to :post
  
 
end
