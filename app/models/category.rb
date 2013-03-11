class Category < ActiveRecord::Base
  # attr_accessible :title, :body
  has_many :categorizations 
  has_many :posts, :through => :categorizations
  attr_accessible :name, :description, :short_name
  
  
  
 # validates_presence_of :name, :short_name, :description
	#validates_length_of :name, :within => 3..50
	#validates_length_of :short_name, :within => 3..30
	#validates_length_of :description, :maximum => 255
  
end
