class MotMailer < ActionMailer::Base
  default :from => "motasreminder@gmail.com"

  def mot_reminder(thisuser, mot)
    @user = thisuser
    @mot = mot
    @send = Mot.joins(:users)
    #mail(:to => user.email, :subject => "Your M.O.T renewal is due")
    mail(:to => "#{thisuser[0].name} <#{thisuser[0].email}>", :subject => "Your M.O.T is due for renewal soon")
  end
end
