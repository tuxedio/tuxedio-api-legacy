require 'custom_validations'

class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  #attr_accessible :name, :email, :location, :password, :password_confirmation

  self.inheritance_column = :user_role
  scope :customer, -> { where(user_role: 'Customer')}
  scope :vendor,   -> { where(user_role: 'Vendor')}
  scope :admin,    -> { where(user_role: 'Admin')}

  # before_save { self.email = email.downcase }

  # validates :name,         presence: true, length: { maximum: 50 }
  # validates :location,     presence: true, length: { maximum: 30 }
  # validates :email,        presence: true, email: true, uniqueness: { case_sensitive: false }
  # validates :password,     length: { minimum: 6 }
  # has_secure_password

  # validates :vendor,       :inclusion => { :in => [true, false] }
  # validates :customer,     :inclusion => { :in => [true, false] }
  # validates :blogger,      :inclusion => { :in => [true, false] }

  # validates_with ExclusiveValidator
  # validates_with VendorValidator

  def self.allowed_locations
    ['Boulder', 'Longmont', 'Broomfield']
  end

end
