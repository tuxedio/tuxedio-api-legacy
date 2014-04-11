module UserValidations
  extend  ActiveSupport::Concern
  include ActiveModel::Validations

  included do
    validates :name,         presence: true, length: { maximum: 50 }
    validates :location,     presence: true, length: { maximum: 30 }
    validates :email,        presence: true, email: true, uniqueness: { case_sensitive: false }
    validates :password,     length: { minimum: 6 }
    has_secure_password

    validates :vendor,       :inclusion => { :in => [true, false] }
    validates :customer,     :inclusion => { :in => [true, false] }
    validates :blogger,      :inclusion => { :in => [true, false] }
  end
end
