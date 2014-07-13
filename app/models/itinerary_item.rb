class ItineraryItem < ActiveRecord::Base
  #--------------------------------------------------------
  # Attributes
  attr_accessible :activity, :activity_time, :customer, :vendor


  #--------------------------------------------------------
  # Associations
  has_one :activity, through: :activity_time
  has_one :customer, through: :adventure
  has_one :vendor,   through: :activity_time

  belongs_to :activity_time
  belongs_to :adventure


  #--------------------------------------------------------
  # Validations
  validates :activity_time, presence: true
  validates :adventure,          presence: true
  validates :customer,      presence: true
  validates :vendor,        presence: true

end
