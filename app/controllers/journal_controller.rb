class JournalController < ApplicationController
  
  def index
    @entries = Journal.where(user_id: session['user_id']).all
  end

  def new
    @entry = Journal.new
  end
  
  def create
    @entry = Journal.new(params[:entry])
    @entry.jid = SecureRandom.hex(13)
    if @entry.save
      redirect_to :action => "show", :id => @entry.jid
    else
      redirect_to journal_url, :notice => "Something went wrong. Please try again."
    end
  end
  
  def show
    e = Journal.where(jid: params[:jid]).first
    if e.id == session['user_id']
      @entry = e
    else
      redirect_to :action =>  "index"
    end
  end

end
