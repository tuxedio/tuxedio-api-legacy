class ItineraryItem < ActiveRecord::Base

  attr_accessible :activity_time, :activity

  has_one :activity, through: :activity_time
  has_one :customer, through: :trip
  has_one :vendor,   through: :activity_time

  belongs_to :activity_time
  belongs_to :itemable, polymorphic: true
  belongs_to :trip

end
