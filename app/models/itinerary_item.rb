class ItineraryItem < ActiveRecord::Base

  #ACCESSORS
  attr_accessible :activity_id, :trip_id, :activity_time_id

  #VALIDATION
  validates :trip_id,           presence: true
  validates :activity_id,       presence: true
  validates :activity_time_id,  presence: true

  ##### This should be validated later, but we need to implement selectors first.

  validates_presence_of :trip
  validates_presence_of :activity

  #ASSOCIATIONS
  belongs_to :trip
  belongs_to :activity
  belongs_to :activity_time

end
