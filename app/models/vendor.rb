class Vendor < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable, :confirmable

  #ACCESS ATTRIBUTES OF THE MODEL
  attr_accessible :name, :email, :location, :password, :password_confirmation

  #VALIDATION
  validates :name,         presence: true, length: { maximum: 50 }
  validates :location,     presence: true, length: { maximum: 30 }
  validates :email,        presence: true, :email => true
  validates_with VendorValidator

  #Condition to make locations local
  def self.allowed_locations
    ['Boulder', 'Longmont', 'Broomfield']
  end

end