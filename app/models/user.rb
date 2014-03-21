class User < ActiveRecord::Base
  validates :name,     presence: true
  validates :email,    presence: true
  validates :location, presence: true

  # possibly only need to validate only one
  # (i.e. if vendor, then implicitly not customer)
  validates :vendor,   presence: true
  validates :customer, presence: true
end
