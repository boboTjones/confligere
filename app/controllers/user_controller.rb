class UserController < ApplicationController
  
  protect_from_forgery :except => :create
  
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
    @user = User.new(check_params(params[:user]))
    puts @user
    if @user.save
      redirect_to login_url, :notice => "Try logging in now!"
    else
      redirect_to :action => "new", :notice => "DAG NABBIT"
    end
  end

  def update
    begin
      current_user.update!(check_params(params[:user]))
    rescue => e
    end  
    if !request.xhr?
      puts "MOOSE BOOGERS"
      redirect_to :action => "index"
    else
      render :nothing => true
    end
  end

  def basic
    render :partial => "basic"
  end
  
  def personal
    @user = current_user
    render :partial => "personal"
  end
  
  def relationships
    @relationship = Relationship.new
    @relationships = current_user.relationships
    render :partial => "relationships"
  end
  
  def relationship
    begin
      @relationship = current_user.relationships.find params[:id]
    rescue => e
      puts e
    end
    render :partial => "edit_relationship"    
  end
  
  def mod_relationship
    if params[:id]
      r = current_user.relationships.find params[:id]
    else
      r = Relationship.new(:user_id => current_user.id)
    end
    case params[:a]
    when "delete"
      r.delete
    else
      begin
        r.update!(check_params(params[:relationship]))
      rescue => e
        puts e
      end
    end
    if !request.xhr?
      redirect_to :action => "index"
    else
      render :nothing => true
    end
  end
  
  def expectations
    @expectations = current_user.expectations
    @expectation = Expectation.new
    render :partial => "expectations"
  end
  
  def expectation
    #Seriously?
    begin
      @expectation = current_user.expectations.find params[:id]
    rescue => e
      puts e
    end
    render :partial => "edit_expectation"
  end
  
  def mod_expectation
    if params[:id]
      e = current_user.expectations.find params[:id]
    else
      e = Expectation.new(:user_id => current_user.id)
    end
    case params[:a]      
    when "delete"
      begin
        e.delete
      rescue => e
        puts e
      end
    else
      begin
        e.update!(check_params(params[:expectation]))
      rescue => e
        puts e
      end
    end
    if !request.xhr?
      redirect_to :action => "index"
    else
      render :nothing => true
    end
  end

  
  def password
    @user = current_user
    render :partial => "password"
  end

  private
  
  def check_params(params)
    ## XXX ToDo:
    ## This sucks, but I can't make Rails4 params thing work the way I need it to.
    ## Obviously, more research is required
    
    allowed = ["first_name", "last_name", "username", "email", "password", "password_confirmation", 
      "marital_status","orientation", "gender", "so_is_user", "age", "occupation", 
      "education", "summary", "scale", "children", "occupation", "first_contact", "duration",
      "nickname"]
      params.delete_if { |k,v| !allowed.include?(k) }
    return params
  end
  
  def user_params
    params.require(:username).permit(:email, :address, :first_name, :last_name, :password,  :password_confirmation)
  end

end
