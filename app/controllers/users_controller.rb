class UsersController < ApplicationController
  ## XXX ToDo: skip session check for new and create?

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
  
  def edit
    @user = User.find(current_user.id)
  end
  
  def update
    u = User.find(current_user.id)
    begin
      u.update!(params[:user])
    rescue => e
    end
    redirect_to :action => "edit"
  end

  private
  
  def user_params
    params.require(:username).permit(:email, :address, :first_name, :last_name, :password,  :password_confirmation)
  end

end
