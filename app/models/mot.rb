class Mot < ActiveRecord::Base
  #table called mots
  #sets the attribute to be accessed by other methods
  attr_accessible :mot_date
  #attr_accessor :mot_date
  # set the relationship with the Mot user
  belongs_to :user


#  validates :mot_date, :length => {:maximum => 10 }
  validates :user_id, :presence => true

end
