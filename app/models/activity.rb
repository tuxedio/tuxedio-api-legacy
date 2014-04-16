class Activity < ActiveRecord::Base
  attr_accessible   :name, :location, :price, :description, :vendor_id

  validates  :name,         presence: true, length: { maximum: 30 }
  validates  :location,     presence: true, length: { maximum: 30 }
  validates  :price,        presence: true,
                            numericality: {:greater_than => 0}
  validates  :vendor_id,    presence: true
  belongs_to :vendor
end
