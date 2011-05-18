class MotMailer < ActionMailer::Base
  default :from => "motasreminder@gmail.com"

  def mot_reminder(user, mot)
    @user = user
    @mot = mot
    mail(:to => user.email, :subject => "Your M.O.T renewal is due")
    
  end

end
