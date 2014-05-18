class Trip < ActiveRecord::Base

  #ACCESSORS
  attr_accessible :trip_name, :customer, :location, :start_date, :number_of_days, :id

  #VALIDATION
  validates :trip_name,      presence: true
  validates :customer,       presence: true
  validates :start_date,     presence: true
  validates :number_of_days, presence: true, numericality: { greater_than: 0 }
  validates :customer,       presence: true

  validates_with LocationValidator
  validates_with FutureDateValidator

  #ASSOCIATIONS
  belongs_to :customer
  has_many :itinerary_items
  has_many :activities, through: :itinerary_items

end
