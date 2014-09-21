class V1::JourneyItem < ActiveRecord::Base
  #--------------------------------------------------------
  # Attributes
  attr_accessible :experience, :experience_time, :person, :vendor

  #--------------------------------------------------------
  # Associations
  has_one :experience, through: :experience_time
  has_one :person,     through: :adventure
  has_one :vendor,     through: :experience_time

  belongs_to :experience_time
  belongs_to :adventure

  #--------------------------------------------------------
  # Validations
  validates :experience_time, presence: true
  validates :adventure,       presence: true
  validates :person,          presence: true
  validates :vendor,          presence: true
end
