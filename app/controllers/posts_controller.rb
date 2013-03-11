class PostsController < ApplicationController
	
	layout 'staff'
    before_filter :set_archive_list
  
  def index
    list
    render :action => 'list'
   
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
#verify :method => :post, :only => [ :destroy, :create, :update ],
 #      :redirect_to => { :action => :list }

  def list
   @posts = Post.paginate(:include => [:author, :categories],
		    :per_page => 5, :page => params[:page])
  end

  def show
   	 @post = Post.find(params[:id])
     @all_categories = Category.find(:all, :order => 'name ASC')
     render(:template => 'main/view_post', :layout => 'application')
  end
  
  alias :view_post :show

  def new
    @post = Post.new
    @user_list = get_user_list
   # @one_user = get_user
    @all_categories = get_all_categories
  end

  def create
  	post_params = params[:post]
  	author_id = post_params.delete(:author_id)
  	
  	@all_categories = get_all_categories
  	checked_categories = get_categories_from(params[:categories])
  	removed_categories = @all_categories - checked_categories
  	  	
    @post = Post.new(post_params)
   # @post.author = User.find(author_id)
	 @get_one_user = 1
	 @post.author_id = @get_one_user
    if @post.save
    	
      checked_categories.each {|cat| @post.categories << cat if ! @post.categories.include?(cat)}
      removed_categories.each {|cat| @post.categories.delete(cat) if @post.categories.include?(cat)}
    	
      flash[:notice] = 'Post was successfully created. Please wait for some time admin will commit it'
      redirect_to(:controller => 'main',:action=>'list')
      #redirect_to :action => 'list'
    else
	      @user_list = get_user_list
	      @all_categories = get_all_categories
	      render :action => 'new'
    end
  end

  def edit
    @post = Post.find(params[:id])
    @user_list = get_user_list
     @all_categories = get_all_categories
  end

  def update
    post_params = params[:post]
  	author_id = post_params.delete(:author_id)
  
	
  	@all_categories = get_all_categories
  	checked_categories = get_categories_from(params[:categories])
  	removed_categories = @all_categories - checked_categories
  	
		@get_one_user = 1
    @post = Post.find(params[:id])
   # @post.author = User.find(author_id) if @post.author_id != author_id
    @post.author_id = @get_one_user
    if @post.update_attributes(post_params)
    	
    	checked_categories.each {|cat| @post.categories << cat if ! @post.categories.include?(cat)}
    	removed_categories.each {|cat| @post.categories.delete(cat) if @post.categories.include?(cat)}
    	
      flash[:notice] = 'Post was successfully updated.'
      render :action => 'show', :id => @post
    else
      @user_list = get_user_list
      render :action => 'edit'
    end
  end
  
  def delete
    @post = Post.find(params[:id])
 end
  
  def destroy
    post = Post.find(params[:id])
    post.destroy
    flash[:notice] = "Page Deleted successfully"
    redirect_to(:action => 'list')
  end

  private #----------
  
#  def get_one_user1
 
 #  return User.find(|user| [user.full_name, user.id])
  #  return User.find()
#  end


#def get_user

  #return User.find(params[:id => @get_one_user]).full_name
 #return User.select('display_name').where(:id => @get_one_user)
#end

  def get_user_list
    return User.find(:all, :order => 'last_name ASC').collect {|user| [user.full_name, user.id]}
  end

  def get_all_categories
  	return Category.find(:all, :order => 'name ASC')
  end	
  
  def get_categories_from(cat_list)
  	cat_list = [] if cat_list.blank?
  	return cat_list.collect {|cid| Category.find_by_id(cid.to_i)}.compact
  end	
  
   def set_archive_list
    posts = Post.find(:all, :conditions => ["status = 'published'"], :order => "created_at DESC")
		@archive_list = posts.collect do |p|
		  [p.created_at.strftime("%b %Y"), p.created_at.year, p.created_at.month]
		end
		@archive_list.uniq!
   end

end
