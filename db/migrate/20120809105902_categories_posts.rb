class CategoriesPosts < ActiveRecord::Migration
  
	
	def up
  	
  	#remove_column("categories_posts", "catagory_id")
  	
  	#drop_table :categories_posts
  	 create_table :categories_posts, :id => false do |t|
  	 	t.integer "category_id"
  	 	t.integer "post_id"
  	 end
  	 add_index("categories_posts", "category_id")
  	 add_index("categories_posts", "post_id")	
  	# remove_column("blog_posts", "category")
  end

  def down
  end
end
