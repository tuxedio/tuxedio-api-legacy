class V1::JourneyItem < ActiveRecord::Base
  #--------------------------------------------------------
  # Attributes
  attr_accessible :experience, :experience_time, :person, :vendor

  #--------------------------------------------------------
  # Associations
  has_one :experience, through: :experience_time, class_name: 'V1::Experience'
  has_one :person,     through: :adventure,       class_name: 'V1::Person'
  has_one :vendor,     through: :experience_time, class_name: 'V1::Vendor'

  belongs_to :experience_time, class_name: 'V1::ExperienceTime'
  belongs_to :adventure,       class_name: 'V1::Adventure'

  #--------------------------------------------------------
  # Validations
  validates :experience_time, presence: true
  validates :adventure,       presence: true
  validates :person,          presence: true
  validates :vendor,          presence: true
end
