class MotRemindersController < ApplicationController

  def check_mots
    require 'time'

    # WORKS IN POSTGRES
    @mots = Mot.where(Time.now.utc, Time.now.utc+1.week )
 #   @mots = Mot.find(:all, :order => "date")


    @mots.each do |mot|

      if mot.mot_date-1.hour < Time.now.utc
        #send e-mail
      MotMailer.mot_reminder(@mot).deliver #or (@user) ?

      elsif mot.mot_date-1.day < Time.now.utc

      end
    end
  end
end
