class V1::Experience < ActiveRecord::Base
  #--------------------------------------------------------
  # Constants

  PRICE_REGEX = /\A^\d+??(?:\.\d{0,2})?$\z/

  #--------------------------------------------------------
  # Associations

  has_many  :experience_times, class_name: 'V1::ExperienceTime'

  belongs_to :vendor, class_name: 'V1::Vendor'

  #--------------------------------------------------------
  # Validations

  validates  :name,        presence: true, length: { maximum: 100  }
  validates  :location,    presence: true, length: { maximum: 30  }
  validates  :description, presence: true, length: { maximum: 160 }
  validates  :vendor,      presence: true
  validates  :price,       presence: true,
                           numericality: { greater_than_or_equal_to: 0 },
                           format: { :with => PRICE_REGEX }

  validates_with LocationValidator

  has_attached_file :picture, :styles => { medium: "300x300#", thumb: "100x100#" }

  validates_attachment_content_type :picture,
    :content_type => /^image\/(png|gif|jpeg|jpg)/,
    :message => 'Only .png .gif .jpeg .jpg images, please.'

  validates_attachment_size :picture,
    :less_than => 10.megabytes,
    :message => "Picture too large."
end

