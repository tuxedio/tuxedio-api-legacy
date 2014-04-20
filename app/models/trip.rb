class Trip < ActiveRecord::Base

  #ACCESSORS
  attr_accessible :trip_name, :customer_id, :location, :start_date, :number_of_days

  #VALIDATION
  validates :trip_name,  presence: true
  validates :customer_id,   presence: true
  validates :start_date, presence: true
  validates :number_of_days, presence: true, numericality: { greater_than_or_equal_to: 0 }


  #ASSOCIATIONS
  belongs_to :customer
  has_many :itinerary_items
  has_many :activities, through: :itinerary_items

end
