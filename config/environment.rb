# Load the Rails application.
require File.expand_path('../application', __FILE__)

# Initialize the Rails application.
Confligere::Application.initialize!
ENV["RAILS_ENV"] = "development"
ENV["MIXPANEL_SECRET_TOKEN"] = "9d34f0fe337a274ad2fb72f78c55585f"
