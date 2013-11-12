class AccountController < ApplicationController    

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

  private
  
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
