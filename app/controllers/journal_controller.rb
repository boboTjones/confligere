class JournalController < ApplicationController
  
  def index
    @entries = Journal.find(:all)
  end

  def new
    @entry = Journal.new
  end
  
  def create
    @entry = Journal.new(params[:entry])
    if @entry.save
      redirect_to :action => "show", :id => @entry.id
    else
      redirect_to journal_url, :notice => "Something went wrong. Please try again."
    end
  end
  
  def show
    @entry = Journal.find(params[:id])
  end

end
