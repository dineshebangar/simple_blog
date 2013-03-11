class Post < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :title, :content, :author_id, :status, :comments_count, :created_at
  self.table_name = "blog_posts"
 
   belongs_to :author, :class_name => "User", :foreign_key => "author_id"
   has_many :comments, :order => 'created_at ASC', :dependent => :destroy
   has_many :categorizations 
   has_many :categories, :through => :categorizations 
   has_many :approved_comments, :class_name => 'Comment', :conditions => "comments.status = 'approved'"
    					  #or 
   #def approved_comments
  # 	self.comments.find(:all, :conditions => "status = 'approved'")
   #end	
   
    validates_presence_of :title, :content
	validates_uniqueness_of :title
	validates_length_of :title, :minimum => 4
	#validates_inclusion_of :status, :in => %w{draft published}
   
   @post = Post.new
   Post.find(:all).each do |post|
   	    @post = post
  		current_count = @post.comments.length
  		@post.update_attributes(:comments_count => current_count)
  		@post.save
  	end	
  	
  		self.table_name = "blog_posts"
  		
  		
  
end

 