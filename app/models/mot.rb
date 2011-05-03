class Mot < ActiveRecord::Base
  #table called mots
  #sets the attribute to e accessed by other methods
  attr_accessible :mot_date

  # set the relationship with the Mot user
  belongs_to :user

  default_scope :order => 'mots.created_at DESC'

  validates :mot_date, :length => {:maximum => 10 }
  validates :user_id, :presence => true

end
