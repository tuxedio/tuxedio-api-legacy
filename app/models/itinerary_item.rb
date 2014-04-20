class ItineraryItem < ActiveRecord::Base

  #VALIDATION
  validates :trip_id,  presence: true
  validates :activity_id,   presence: true

  #ASSOCIATIONS
  belongs_to :trip
  belongs_to :activity

end
