class CreateUsers < ActiveRecord::Migration
  def change
    create_table :users do |t|
    	t.string "username", :limit => 25
		t.string "hashed_password", :limit => 25
		t.string "first_name", :limit => 25
		t.string "last_name", :limit => 25
        t.string "email", :limit => 25
        t.string "display_name", :limit => 25
        t.integer "user_level", :limit => 3

      t.timestamps
    end
  end
end
