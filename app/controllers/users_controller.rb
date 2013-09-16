class UsersController < ApplicationController
  ## XXX ToDo: skip session check for new and create?

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_url
    else
      redirect_to root_url, :notice => "DAG NABBIT"
    end
  end

  private
  
  def user_params
    params.require(:username).permit(:email, :address, :first_name, :last_name, :password)
  end

end
