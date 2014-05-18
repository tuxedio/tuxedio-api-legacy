class ItineraryItem < ActiveRecord::Base

  attr_accessible :activity, :activity_time, :customer, :vendor

  has_one :activity, through: :activity_time
  has_one :customer, through: :trip
  has_one :vendor,   through: :activity_time

  belongs_to :activity_time
  belongs_to :trip

  validates :activity_time, presence: true
  validates :trip,          presence: true

end
