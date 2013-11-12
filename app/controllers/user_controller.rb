class UserController < ApplicationController
  def index
    ## XXX ToDo: 
    ## Passing options to #find is deprecated. Please build a scope and then call #find on it.
    @user = User.find(current_user.id)
  end

 def new
    @user = User.new
  end

  def create
    #@user = User.new(user_params)
    # XXX ToDo: mass assignment, ftl
    @user = User.new(params[:user])
    puts @user
    if @user.save
      redirect_to login_url, :notice => "Try logging in now!"
    else
      redirect_to :action => "new", :notice => "DAG NABBIT"
    end
  end

  def update
    u = User.find(current_user.id)
    begin
      u.update!(check_params(params[:account]))
    rescue => e
    end
    redirect_to :action => "index"
  end

  def basic
    render :partial => "basic"
  end
  
  def personal
    @user = current_user
    render :partial => "personal"
  end
  
  def affiliations
    render :partial => "affiliations"
  end
  
  def expectations
    @expectations = current_user.expectations.all
    @expectation = Expectation.new
    render :partial => "expectations"
  end
  
  def password
    @user = current_user
    render :partial => "password"
  end

  private
  
  def check_params(params)
    ## This sucks, but I can't make Rails4 params thing work the way I need it to.
    ## Obviously, more research is required
    ## {"id"=>nil, "username"=>nil, "email"=>nil, "password_hash"=>nil, "password_salt"=>nil, "first_name"=>nil, 
    ## "last_name"=>nil, "created_at"=>nil, "updated_at"=>nil, "marital_status"=>nil, 
    ## "orientation"=>nil, "gender"=>nil, "so_is_user"=>false, "age"=>nil, "occupation"=>nil, "education"=>nil}
    
    allowed = ["first_name", "last_name", "password", "password_confirmation", "marital_status","orientation", "gender", "so_is_user", "age", "occupation", "education"]
    return params.delete_if { |k,v| !allowed.include?(k) }
  end
  
  def user_params
    params.require(:username).permit(:email, :address, :first_name, :last_name, :password,  :password_confirmation)
  end

end
