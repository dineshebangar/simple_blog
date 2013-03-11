class AlterPosts < ActiveRecord::Migration
  def up
  	
  	rename_table("posts", "blog_posts")
  	
  	rename_column("blog_posts", "body", "content")
  	#change_column("blog_posts", "author", :integer, :default => 0,  :null => false)
  	#rename_column("blog_posts", "author", "author_id")
  	
  	add_index("blog_posts", "author_id")
  end

  def down
  
  	remove_index("blog_posts", "author_id")
  	rename_table("blog_posts", "posts")
  	rename_column("posts", "content", "body")
  	#rename_column("posts", "author_id", "author")
  	#change_column("posts", "author", :string, :limit => 50)
  	
  end
end
