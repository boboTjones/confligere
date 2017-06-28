class FakeController < ApplicationController

  def index
    @fake = Fake.new
  end
  
  def create
    f = Fake.new(check_params(params[:fake]))
    begin
      f.save!
    rescue => e
      puts e
    end
    redirect_to :action => "index"
  end
  
  def destroy
    f = Fake.find params[:id]
    begin
      f.destroy!
    rescue => e
      puts e
    end
    redirect_to :action => "index"
  end
  
  def update
    f = Fake.find(params[:id])
    begin
      f.save!
    rescue => e
      puts e
    end
    redirect_to :action => "index"
  end
  
  private
  
  def check_params(params)
    return params
  end

end
