class Trip < ActiveRecord::Base

  #ACCESSORS
  attr_accessible :trip_name, :customer, :location, :start_date, :number_of_days, :id, :activity

  #VALIDATION
  validates :trip_name,       presence: true, length: { maximum: 20 }
  validates :customer,        presence: true
  validates :start_date,      presence: true
  validates :number_of_days,  presence: true, numericality: { greater_than: 0 }
  validates :customer,        presence: true
  validates_date :start_date, on_or_after: Time.now

  validates_with LocationValidator

  #ASSOCIATIONS
  belongs_to :customer
  has_many :itinerary_items, dependent: :destroy
  has_many :activities, through: :itinerary_items

end
