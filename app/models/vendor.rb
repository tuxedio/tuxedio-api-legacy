class Vendor < ActiveRecord::Base

  #--------------------------------------------------------
  # Attributes

  attr_accessible :name, :email, :location, :zip_code, :password,
                  :password_confirmation, :vendor_id, :description,
                  :confirmed, :address, :phone_number, :country,
                  :coordinates, :state, :sample_image, :picture


  #--------------------------------------------------------
  # Associations

  has_many :activities


  #--------------------------------------------------------
  # Validations

  validates :name,         presence: true, length: { maximum: 50 }
  validates :location,     presence: true, length: { maximum: 30 }
  validates :email,        presence: true, email: true, uniqueness: true
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
  # Callbacks

  before_save{ email.downcase! }

  #--------------------------------------------------------
  # Other Macros

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable


  #--------------------------------------------------------
  # Class Methods

  def self.allowed_locations
    ['Boulder', 'Longmont', 'Broomfield']
  end


  #--------------------------------------------------------
  # Instance Methods

  def update_with_yelp_details(data)
    self.update!(
      name:         data[:vendor_name],
      zip_code:     data[:vendor_postal],
      address:      data[:vendor_address],
      phone_number: data[:vendor_phone],
      country:      data[:vendor_country],
      coordinates:  data[:vendor_coordinates],
      sample_image: data[:vendor_image],
      state:        data[:vendor_state]
    )
  end

end
