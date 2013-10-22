class TimelineController < ApplicationController

  def index
    @days = Date::DAYNAMES
    @months = Date::MONTHNAMES.select {|x| x if !x.nil?}
    @current = Time.now.strftime("%B")
  end
  
  def dow
    now = Chronic.parse(params[:month])
    now ||= Time.now
    render :json => endless_numbered_days(now.year,now.month)
  end
  
  private
  
  ## XXX ToDo:
  ## endless_numbered_days returns a JSON string of days with an offset to insert that number
  ## into the correct day of the calendar. This should also return some event ids that can
  ## be used to link to a event landing page.
  
  def endless_numbered_days(year=2011,month=1)
    x = Date.new(year,month,-1).day
    y = Date.new(year,month,1).wday
    cal = {}
    1.upto(x) do |i|
      cal[i] = [y]
      y += 1
    end
    return cal.to_json
  end
  
  def mock_data(month=Time.now.month)
    {month => {"4" => mock_event, "12" => mock_event, "22" => mock_event}}
  end
  
  def mock_event
    [[1,"System Failure"], [2,"System reboot"], [3,"Server not responding"], [4,"Failed login attempt"], [5,"Uknown Error"], [6,"Configuration file changed"]].random
  end

end
