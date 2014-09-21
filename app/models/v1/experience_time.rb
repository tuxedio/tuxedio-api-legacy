class V1::ExperienceTime < ActiveRecord::Base
  attr_accessible :start_time, :end_time, :experience_id, :adventure

  validates :start_time, presence: true
  validates :end_time,   presence: true
  validates :experience, presence: true

  validates_datetime :start_time, :after => Time.now
  validates_datetime :end_time,   :after => :start_time

  belongs_to :experience, class_name: 'V1::Experience'

  has_one :vendor,    through: :experience,     class_name: 'V1::Vendor'
  has_one :adventure, through: :experience,     class_name: 'V1::Adventure'
  has_many :journey_items, dependent: :destroy, class_name: 'V1::JourneyItem'

  def format_time
    start_time.to_s :short
  end
end
