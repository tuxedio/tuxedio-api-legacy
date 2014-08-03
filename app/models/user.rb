class User < ActiveRecord::Base
  #--------------------------------------------------------
  # Attributes

  attr_accessible :email, :password, :password_confirmation, :remember_me

  #--------------------------------------------------------
  # Associations

  belongs_to :rolable, :polymorphic => true

  #--------------------------------------------------------
  # Validations

  validates :email,        presence: true, email: true, uniqueness: true

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

  def person?
    if self.rolable_type == "Person"
      return true
    end
    return false
  end
  def vendor?
    if self.rolable_type == "Vendor"
      return true
    end
    return false
  end

end
