class CreateCategories < ActiveRecord::Migration
  def change
    create_table :categories do |t|
    	t.string "name", :limit => 50
    	t.string "short_name", :limit => 20
    	t.string "description", :limit => 100
      t.timestamps
    end
    
  end
end
