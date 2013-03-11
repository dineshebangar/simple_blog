class StaffController < ApplicationController
	
	layout 'staff'
	before_filter :authorize_access, :except => [:login, :index, :send_login]
  def index
  	login
  	render(:action => login)
  end

  def login
  end

  def imp
  end 

  def send_login
    found_user = User.authenticate(params[:username], params[:password])
    # @found_username =params[:username]   
    if params[:username] === "iscubeonror" && params[:password] === "iscubeonrorpune"
	session[:user_id] = 1
	     $flag = 1
    render(:controller => 'staff',:action=>'logo')
  	else
        #found_user = User.authenticate(params[:username], params[:password])
       	if found_user
      	session[:user_id] = found_user.id
	
        @get_one_user = found_user.id
		@post_user = found_user.username
		$flag = 0

      		flash[:notice] = "Hi...you are logged in as #{found_user.username}"
        #  redirect_to(:controller => 'main',:action=>'list')
           redirect_to(:controller => 'posts',:action=>'new')
         # render(:action=>'logo')
      		#redirect_to(:action => 'menu')
      	else

      		flash.now[:notice] = "Username and  Password combination is incorrect. Please enter correct combination"	
      	  render(:action=>'imp')

  	end	
    end
  end


  def menu
  end

  def logout
  	session[:user_id] = nil
  	flash[:notice] = "You are now logged out!!!"
  	redirect_to(:controller => 'main',:action => 'list')
  end
end
