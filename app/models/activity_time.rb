class ActivityTime < ActiveRecord::Base
  attr_accessible :start_time, :end_time, :activity_id, :adventure

  validates :start_time,  presence: true
  validates :end_time,    presence: true
  validates :activity,    presence: true

  validates_datetime :start_time, :after => Time.now
  validates_datetime :end_time,   :after => :start_time

  belongs_to :activity
  has_many :itinerary_items, dependent: :destroy
  has_one :vendor, through: :activity
  has_one :adventure, through: :activity end

  def format_time
    start_time.to_s(:short)
  end
