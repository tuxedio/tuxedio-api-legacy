class Trip < ActiveRecord::Base

  #ACCESSORS
  attr_accessible :trip_name, :customer_id

  #VALIDATION
  validates :trip_name,  presence: true
  validates :customer_id,   presence: true

  #ASSOCIATIONS
  belongs_to :customer
  has_many :itinerary_items
  has_many :activities, through: :itinerary_items

end
