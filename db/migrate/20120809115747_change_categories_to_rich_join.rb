class ChangeCategoriesToRichJoin < ActiveRecord::Migration
  def up
  	add_column("categories_posts", "id", :primary_key)
  end

  def down
  	remove_column("categories_posts", "id")
  end
end
