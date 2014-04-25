class Vendor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  before_save{ email.downcase! }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  #ACCESS ATTRIBUTES OF THE MODEL
  attr_accessible :name, :email, :location, :zip_code, :password,
                  :password_confirmation, :vendor_id, :description,
                  :confirmed, :address, :phone_number, :country,
                  :coordinates, :state, :sample_image, :picture

  serialize :coordinates, Hash
  #VALIDATION
  validates :name,         presence: true, length: { maximum: 50 }
  validates :location,     presence: true, length: { maximum: 30 }
  validates :email,        presence: true, email: true, uniqueness: true
  validates :zip_code,     presence: true, length: { maximum: 5 }
  validates_with LocationValidator

  #ASSOCIATIONS
  has_many :activities

  #Condition to make locations local
  def self.allowed_locations
    ['Boulder', 'Longmont', 'Broomfield']
  end

  has_attached_file :picture, :styles => { medium: "300x300#", thumb: "100x100#" }, default_url: ActionController::Base.helpers.asset_path('missing_avatar.jpg')
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/

end
