class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
	t.integer "post_id"
	t.string "author", :limit => 50
	t.string "author_email", :limit => 50
	t.text "content"  
	t.string "status", :limit => 50
      t.timestamps
    end
    add_index("comments", "post_id")
  end
end
