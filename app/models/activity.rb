class Activity < ActiveRecord::Base
  attr_accessible   :name, :location, :price, :description, :vendor_id
  PRICE_REGEX = /\A^\d+??(?:\.\d{0,2})?$\z/ 

  validates  :name,         presence: true, length: { maximum: 30 }
  validates  :location,     presence: true, length: { maximum: 30 }
  validates  :price,        presence: true,
                            numericality:   { greater_than_or_equal_to: 0 },
                            :format => { :with => PRICE_REGEX }
  validates  :vendor_id,    presence: true, uniqueness: true
  
  belongs_to :vendor
end
