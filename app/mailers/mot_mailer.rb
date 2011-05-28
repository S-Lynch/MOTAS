class MotMailer < ActionMailer::Base
  default :from => "motasreminder@gmail.com"

  def mot_reminder(user, mot)
    @user = user
    @mot = mot
    @send = Mot.joins(:users)
    #mail(:to => user.email, :subject => "Your M.O.T renewal is due")
    mail(:to => "#{@send.name} <#{@send.email}>", :subject => "Your email is due for renewal soon")
  end

end
