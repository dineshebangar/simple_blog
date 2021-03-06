class Comment < ActiveRecord::Base
  # attr_accessible :title, :body
  
  belongs_to :post, :counter_cache => true
  
  attr_accessible :post_id, :author, :author_email, :content, :status
  
    validates_presence_of :author, :author_email, :content, :status
	validates_length_of :author, :within => 3..25
	validates_inclusion_of :status, :in => %w{new approved spam}
	validates_format_of :author_email, 
	    :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i

	    
	def before_validation
	  self.author.strip!
	  self.author_email.strip!
	end
	
	private
	
  # The validate method is used for custom validations.
  # Note that it must be a private method.
	def validate
	  errors.add(:author, " can't be Kevin.") if self.author == "Kevin"
	  errors.add_to_base("John can't be the author.") if self.author == "John"
	end
end


