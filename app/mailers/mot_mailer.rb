class MotMailer < ActionMailer::Base
  default :from => "motasreminder@gmail.com"

  def mot_reminder(user, mot)
    @user = user
    @mot = mot
    #mail(:to => user.email, :subject => "Your M.O.T renewal is due")
    mail(:to => "#{@user.name} <#{@user.email}>", :subject => "Your email is due for renewal soon")
  end

end
