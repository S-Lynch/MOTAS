class Mot < ActiveRecord::Base
  #table called mots
  #sets the attribute to e accessed by other methods
  attr_accessible :mot_date
  #attr_accessor :mot_date
Mot.joins(:users).where('mots.mot_date is not null')
  # set the relationship with the Mot user
  belongs_to :user


#  validates :mot_date, :length => {:maximum => 10 }
  validates :user_id, :presence => true

end
