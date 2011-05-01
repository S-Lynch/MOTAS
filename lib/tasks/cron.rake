# insert the cron stuff in here

#example
#desc "This task is called by the Heroku cron add-on"
#task :cron => :environment do

 # puts "requesting homepage to refresh cache"
 # uri = URI.parse('http://halturki.com')
 # Net::HTTP.get(uri)
 # puts "end requesting homepage"

  #puts "start sending daily mail"
 # User.notified_today.each do |user|
#    Delayed::Job.enqueue UserMailer.daily_mail(user).deliver
  #end
 # puts "end sending daily mail"

#end

desc "This task is called by the Heroku cron add-on"
task :cron => :environment do
#  if Time.now.hour % 4 == 0 # run every four hours
 #   puts "Updating feed..."
  #  NewsFeed.update
 #   puts "done."
 # end

  if Time.now.hour == 0 # run at midnight
    puts "Sending M.O.T reminders..." # start of the cron
    Mot.check_mots # calls the check_mots method
    #insert the sending of e-mail stuff
    puts "done" # end of the cron
  end
end