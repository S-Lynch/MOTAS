class UserMailer < ActionMailer::Base
  default :from => "motasreminder@gmail.com"

  def registration_confirmation(user)
    @user = user
   # @email = email
    # adds an image or attachment to the email
  #  attachments["rails.png"] = File.read("#{Rails.root}/public/images/rails.png")
   # mail(:to => "#{user.name} <#{user.email}>", :subject => "Your M.O.T reminder")
#   mail(:to => user.email, :subject => "Registered")
    mail(:to => "<#{@user.email}>", :subject => "Registered")
  end
end

#{@user.name} 