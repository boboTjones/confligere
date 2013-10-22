class AccountController < ApplicationController    
  def index
    ## XXX ToDo: 
    ## Passing options to #find is deprecated. Please build a scope and then call #find on it.
    @user = User.find(current_user.id)
  end
  
  def update
    u = User.find(current_user.id)
    begin
      u.update!(check_params(params[:account]))
    rescue => e
    end
    redirect_to :action => "index"
  end

  def stuff
    ## return json something like
    ## "Label Name" : ["corresponding field name", "corresponding field value"]
    ## to be marshalled up as $scope.basics, then use { b in basics } to create
    ## a form?
    ## I gave up on this, but I'm going to leave it here so that I don't forget... something...
    
    pizzle = {}
    
    case params[:m]
    when "basic"
      render json: get_user_attributes(current_user, :first_name, :last_name, :email)
    when "personal"
      render json: get_user_attributes(current_user, :marital_status, :orientation, :age, :occupation, :education, :children)
    when "expectations"
      render json: {}
    when "affiliations"
      render json: get_user_attributes(current_user, :so_is_user)
    when "password"
      render json: {}
    else
      # hm
    end
  end
  
  def basic
    render :partial => "basic"
  end
  
  def personal
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
  
  def get_user_attributes(u, *args)
    label_xlate = { "first_name" => "First Name",
      "last_name" => "Last Name", "email" => "Email", "password" => "password", "marital_status" => "Marital Status", 
      "orientaion" => "Sexual Orientation", "gender" => "Gender Identity", "age" => "Current Age", 
      "occupation" => "Occupation", "education" => "How many years of education?", "children" => "How many children?",
      "so_is_user" => "Does your SO have an account on this site?"
    }
    
    p = u.attributes.select {|k,v| k.match(args.join("|"))}
    out = []
    p.each do |k,v|
      ## making everything a text field for now. 
      out << {:label => label_xlate[k], :value => v, :name => k, :type => "text"}
    end
    return out.to_json
  end
  
end
