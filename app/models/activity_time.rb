class ActivityTime < ActiveRecord::Base
  attr_accessible :start_time, :end_time, :activity_id

  validates :start_time, presence: true
  validates :end_time,   presence: true

  belongs_to :activity
end
