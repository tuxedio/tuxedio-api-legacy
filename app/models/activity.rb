class Activity < ActiveRecord::Base
  PRICE_REGEX = /\A^\d+??(?:\.\d{0,2})?$\z/

  attr_accessible   :name, :location, :price, :description, :vendor_id, :picture

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

  def Activity.post_image_url
    random = rand(5)
    "sample_act_pic/#{ random }.jpg"
  end

  if Rails.env == 'production'
    has_attached_file :picture, :styles => { medium: "300x300#", thumb: "100x100#" }, default_url: 'missing_activity_pic.jpg'
  else
    has_attached_file :picture, :styles => { medium: "300x300#", thumb: "100x100#" },
    :default_url => post_image_url
  end

  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
  has_many  :itinerary_items
  has_many  :activity_times
  has_many  :trips, through: :itinerary_items

end
