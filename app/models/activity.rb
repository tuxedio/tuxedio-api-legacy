class Activity < ActiveRecord::Base
  #--------------------------------------------------------
  # Constants

  PRICE_REGEX = /\A^\d+??(?:\.\d{0,2})?$\z/

  #--------------------------------------------------------
  # Attributes

  attr_accessible   :name, :location, :price, :description, :vendor, :picture, :id

  #--------------------------------------------------------
  # Associations

  has_many  :activity_times
  belongs_to :vendor

  #--------------------------------------------------------
  # Validations

  validates  :name,        presence: true, length: { maximum: 100  }
  validates  :location,    presence: true, length: { maximum: 30  }
  validates  :description, presence: true, length: { maximum: 160 }
  validates  :vendor,      presence: true
  validates  :price,       presence: true,
                           numericality:   { greater_than_or_equal_to: 0 },
                           format: { :with => PRICE_REGEX }

  has_attached_file :picture, :styles => { medium: "300x300#", thumb: "100x100#" }
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

end

