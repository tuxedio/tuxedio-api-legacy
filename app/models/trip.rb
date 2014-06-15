class Trip < ActiveRecord::Base

  #--------------------------------------------------------
  # Attributes

  attr_accessible :name, :customer, :location, :start_date, :number_of_days, :id, :activity

  #--------------------------------------------------------
  # Associations

  belongs_to :customer
  has_many :itinerary_items, dependent: :destroy
  has_many :activities, through: :itinerary_items

  #--------------------------------------------------------
  # Validations

  validates :name,            presence: true, length: { maximum: 20 }
  validates :customer,        presence: true
  validates :start_date,      presence: true
  validates :number_of_days,  presence: true, numericality: { greater_than: 0 }
  validates :customer,        presence: true

  validates_date :start_date, on_or_after: Time.now
  validates_with LocationValidator

end
