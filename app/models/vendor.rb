class Vendor < ActiveRecord::Base

  #--------------------------------------------------------
  # Attributes

  attr_accessible :name, :email, :location, :zip_code, :description, :picture,
                  :confirmed, :address, :phone_number, :country,
                  :coordinates, :state, :sample_image, :id


  #--------------------------------------------------------
  # Associations

  has_many :experiences, dependent: :destroy
  has_one :user, :as => :rolable


  #--------------------------------------------------------
  # Validations

  validates :name,         presence: true, length: { maximum: 50 }
  validates :location,     presence: true, length: { maximum: 30 }
  validates :zip_code,     presence: true, length: { maximum: 5 }

  validates_with LocationValidator

  serialize :coordinates, Hash

  # Eventually refactor this and move this logic to production.rb
  if Rails.env == 'production'
    has_attached_file :picture, :styles => { medium: "300x300#", thumb: "100x100#" }, default_url: 'missing_avatar.jpg'
  else
    has_attached_file :picture, :styles => { medium: "300x300#", thumb: "100x100#" }, default_url: ActionController::Base.helpers.asset_path('missing_avatar.jpg')
  end

  validates_attachment_content_type :picture,
    :content_type => /^image\/(png|gif|jpeg|jpg)/,
    :message => 'Only .png .gif .jpeg .jpg images, please.'

  validates_attachment_size :picture,
    :less_than => 10.megabytes,
    :message => "Picture too large."

  #--------------------------------------------------------
  # Class Methods

  def self.allowed_locations
    ['Boulder', 'Longmont', 'Broomfield']
  end

  #--------------------------------------------------------
  # Instance Methods


end
