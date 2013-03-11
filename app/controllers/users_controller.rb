class UsersController < ApplicationController
	#before_filter :authorize_access
	 layout "staff"
	# before_filter :authorize_access
  
  def index
  
    list
    render :action => 'list'
  end

  # GETs should be safe (see http://www.w3.org/2001/tag/doc/whenToUseGet.html)
  #verify :method => :post, :only => [ :destroy, :create, :update ],
   #      :redirect_to => { :action => :list }

  def list
   # @user_pages, @users = paginate :users, :per_page => 10
     @users = User.all
  end

 
  def manage
    list
    if request.get? && params[:id].blank? #new
      @user = User.new
    elsif request.post? && params[:id].blank? #create
      @user = User.new(params[:user])
      if @user.save
        flash[:notice] = 'User was successfully created.'
        #redirect_to :action => 'logo'
        redirect_to :action => 'list'
      else
        render :action => 'manage'
      end
    elsif request.get? && !params[:id].blank? #edit
      @user = User.find(params[:id])
    elsif request.post? && !params[:id].blank? #update or delete
      if params[:commit] == 'Edit'
        @user = User.find(params[:id])
        if @user.update_attributes(params[:user])
          flash[:notice] = 'User was successfully updated.'
          redirect_to :action => 'list'
        else
          render :action => 'manage'
        end
      else # action should delete
      	User.find(params[:id]).destroy
        flash[:notice] = 'User was successfully delete.'
        redirect_to :action => 'list'
      end
    end
  end


def new
    @user1 = User.new
end

def create
    @user1 = User.new(params[:user1])
    if @user1.save
      flash[:notice] = 'User was successfully created.'
      #redirect_to :action => 'list'
      #redirect_to(:controller => 'main',:action => 'list')
      redirect_to(:controller => 'staff',:action => 'login')
    else
      render :action => 'new'
    end
end
end
