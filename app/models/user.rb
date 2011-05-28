# require 'digest'
require 'rake'
 #validates all data relating to the User that is to be stored and for encrypting and salting the password
class User < ActiveRecord::Base
  attr_accessor :password, :mot_date
  attr_accessible :name, :email, :password, :password_confirmation

 # accepts_nested_attributes_for :mot_date

  # Used to set the relationship to the corresponding mots table
  has_many :mots, :dependent => :destroy



   # A regular expression to check the validity of the users email
  email_regex = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

   validates :name, :presence => true,
                    :length => {:maximum => 50 }
   validates :email, :presence => true,
                     :format => {:with => email_regex},
                     :uniqueness => {:case_sensitive => false}
   validates :password, :presence => true,
                        :confirmation => true,
                        :length => { :within => 5..25 }
                      
#call the below private method before saving to encrypt the password
  before_save :encrypt_password


   def check_mots
    require 'time'


    @mots = Mot.where(Time.now.utc, Time.now.utc+1.week )
 #   @mots = Mot.find(:all, :order => "date")

    #iterate through each mot abd do the following
    @mots.each do |mot|

      if mot.mot_date-1.day < Time.now.utc
        #send e-mail
      MotMailer.deliver_mot_reminder(@mot)
     #UserMailer.deliver_registration_confirmation(@user)

      elsif mot.mot_date-1.day < Time.now.utc
      end
    end
   end


 def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
 end

  def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end

    def self.authenticate(email, submitted_password)
    user = find_by_email(email)
    return nil  if user.nil?
    return user if user.has_password?(submitted_password)
  end

  def self.authenticate_with_salt(id, cookie_salt)
    user = find_by_id(id)
    (user && user.salt == cookie_salt) ? user : nil
  end

  def feed
   mots
  end

  private

def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end

    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end

    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end

    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end


end