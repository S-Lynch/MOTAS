# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
SampleMOTAS::Application.initialize!

# For Heroku
#config.action_mailer.delivery_method = :smtp
#
#ActionMailer::Base.smtp_settings = {
#  :address  => "smtp.gmail.com",
#  :port  => 587,
#  :user_name  => "motasreminder@gmail.com",
#  :password  => "tariknicksteve6",
#  :authentication  => :login
#}
#
#config.action_mailer.raise_delivery_errors = true