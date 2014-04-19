class Trip < ActiveRecord::Base

  #VALIDATION
  validates :itinerary_item_id,  presence: true}
  validates :customer_id,   presence: true}

  #ASSOCIATIONS
  belongs_to :customer
  has_many :itinerary_items
  has_many :activities, through: :itinerary_items

end
