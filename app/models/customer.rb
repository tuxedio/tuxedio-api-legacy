class Customer < User

  # This section is a repeat from user.rb and can be DRYed with module
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

  validates :bio,      presence: true
  validates :pick_1,   presence: true
  validates :pick_2,   presence: true
  validates :pick_3,   presence: true
end
