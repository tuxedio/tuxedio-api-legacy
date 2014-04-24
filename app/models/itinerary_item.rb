class ItineraryItem < ActiveRecord::Base

  #ACCESSORS
  attr_accessible :activity_id, :trip_id, :start_time, :end_time

  #VALIDATION
  validates :trip_id,      presence: true
  validates :activity_id,  presence: true
  validates :start_time,   presence: true
  validates :end_time,     presence: true

  ##### This should be validated later, but we need to implement selectors first.
  validates_datetime :start_time, :after => Time.now
  validates_datetime :end_time, :after => :start_time

  validates_presence_of :trip
  validates_presence_of :activity

  #ASSOCIATIONS
  belongs_to :trip
  belongs_to :activity
  has_many :activity_times, through: :activities

end
