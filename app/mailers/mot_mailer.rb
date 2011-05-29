class MotMailer < ActionMailer::Base
  default :from => "motasreminder@gmail.com"

  def mot_reminder(user, mot)
   # @user = User.find(:all)
    @mots = Mot.find(:all)
    @user = user
    @mot = mot
    @send = Mot.joins(:users)
    #mail(:to => user.email, :subject => "Your M.O.T renewal is due")
    mail(:to => "#{@user.name} <#{@user.email}>", :subject => "Your M.O.T is due for renewal soon")
  end
end
