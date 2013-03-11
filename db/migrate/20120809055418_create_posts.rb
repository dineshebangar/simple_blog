class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
	t.string "title", :limit => 80
	t.text "body"
	t.integer "author_id", :limit => 50
	t.string "category", :limit => 50
	t.string "status", :limit => 50
      t.timestamps
    end
  end
end
