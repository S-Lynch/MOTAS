class Mot < ActiveRecord::Base
  #table called mots
  #sets the attribute to be accessed by other methods
  attr_accessible :mot_date
  #attr_accessor :mot_date
  # set the relationship with the Mot user
  belongs_to :user


#  validates :mot_date, :length => {:maximum => 10 }
  validates :user_id, :presence => true

  def Mot.check_mots
    require 'time'


   # @mots = Mot.where(Time.now.utc, Time.now.utc+1.week )
 #   @mots = Mot.find(:all, :order => "date")
     @mots = Mot.find(:all)

    #iterate through each mot abd do the following
  #  @mots.each do |mot|

    #  if mot.mot_date-1.day < Time.now.utc
        #send e-mail
      MotMailer.deliver_mot_reminder(@mot)
     #UserMailer.deliver_registration_confirmation(@user)

   #   elsif mot.mot_date-1.day < Time.now.utc
    end
  #  end
 # end

end
