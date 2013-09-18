class SessionsController < ApplicationController
  
  def index
    if current_user.nil?
      redirect_to login_url
    else
      # XXX ToDo: redirect to session referrer, maybe? eg, take user back to... something.
      redirect_to dashboard_url
    end
  end

  def new
    render :new
  end

  def create
    u = User.authenticate(params[:username], params[:password])
    if u
      session[:user_id] = u.id
      redirect_to :controller => "dashboard", :notice => "Logged in!"
    else
      flash.now.alert = "Invalid email or password"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, :notice => "Logged out!"
  end

end
