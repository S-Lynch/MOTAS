#sets up the email settings
ActionMailer::Base.smtp_settings = {
:address => "smtp.gmail.com",
:port => 587, #for gmail,
:domain => "gmail.com",
:user_name => "nicolas.epaminonda",
:password => "stevelynch",
:authentication => "plain",
:enable_starttls_auto => true
}