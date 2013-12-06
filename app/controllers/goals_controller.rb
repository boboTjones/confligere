class GoalsController < ApplicationController

  def index
    @goals = current_user.goals.all
  end

  def new
    @goal = Goal.new
  end
  
  def create
    g = current_user.goals.new(params["goal"])
    begin
      g.save!
    rescue => e
      puts e
    end
    redirect_to :action => "index"
  end

end
