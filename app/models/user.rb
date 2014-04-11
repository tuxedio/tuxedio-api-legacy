require 'custom_validations'

class User < ActiveRecord::Base
  before_save { self.email = email.downcase }
  before_create :create_remember_token

  # This section is a repeat from customer.rb and can be DRYed with module
  #-----------------------------------------------------------------
  validates :name,         presence: true, length: { maximum: 50 }
  validates :location,     presence: true, length: { maximum: 30 }
  validates :email,        presence: true, email: true, uniqueness: { case_sensitive: false }
  validates :password,     length: { minimum: 6 }
  has_secure_password

  validates :vendor,       :inclusion => { :in => [true, false] }
  validates :customer,     :inclusion => { :in => [true, false] }
  validates :blogger,      :inclusion => { :in => [true, false] }
  #-----------------------------------------------------------------

  validates_with ExclusiveValidator
  validates_with VendorValidator

  def self.allowed_locations
    ['Boulder', 'Longmont', 'Broomfield']
  end

  def User.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def User.hash(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  private

    def create_remember_token
      self.remember_token = User.hash(User.new_remember_token)
    end

end
