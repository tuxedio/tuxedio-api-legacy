class Vendor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  before_save{ email.downcase! }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  #ACCESS ATTRIBUTES OF THE MODEL
  attr_accessible :name, :email, :location, :zip_code, :password, :password_confirmation, :vendor_id, :description

  #VALIDATION
  validates :name,         presence: true, length: { maximum: 50 }
  validates :location,     presence: true, length: { maximum: 30 }
  validates :email,        presence: true, email: true, uniqueness: true
  validates :zip_code,     presence: true, length: { maximum: 5 }

  #DETAILS
  validates :phone_number, presence: true, on: :update
  validates :sample_image, presence: true, on: :update
  validates :state,        presence: true, on: :update
  validates :address,      presence: true, on: :update
  validates :country,      presence: true, on: :update
  validates :confirmed,    presence: true, on: :update

  serialized :coordinates, Hash
  validates_with VendorValidator

  #ASSOCIATIONS
  has_many :activities

  #Condition to make locations local
  def self.allowed_locations
    ['Boulder', 'Longmont', 'Broomfield']
  end

end
