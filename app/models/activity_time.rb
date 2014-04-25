class ActivityTime < ActiveRecord::Base
  attr_accessible :start_time, :end_time, :activity_id

  validates :start_time,  presence: true
  validates :end_time,    presence: true
  validates :activity_id, presence: true

  validates_datetime :start_time, :after => Time.now
  validates_datetime :end_time,   :after => :start_time

  belongs_to :activity
end
