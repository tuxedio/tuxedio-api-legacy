class Activity < ActiveRecord::Base
  PRICE_REGEX = /\A^\d+??(?:\.\d{0,2})?$\z/

  attr_accessible   :name, :location, :price, :description, :vendor_id

  validates  :name,         presence: true, length: { maximum: 100  }
  validates  :location,     presence: true, length: { maximum: 30  }
  validates  :description,  presence: true, length: { maximum: 160 }
  validates  :price,        presence: true,
                            numericality:   { greater_than_or_equal_to: 0 },
                            format: { :with => PRICE_REGEX }
  validates  :vendor_id,    presence: true
  validates_presence_of :vendor

  #ASSOCIATIONS
  belongs_to :vendor
  has_many :itinerary_items
  has_many :trips through: :itinerary_items
end
