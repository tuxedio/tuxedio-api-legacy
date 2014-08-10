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
    self.rolable_type == "Person"
  end

  def vendor?
    self.rolable_type == "Vendor"
  end

end
