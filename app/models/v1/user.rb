module V1
  class User < ActiveRecord::Base
    #--------------------------------------------------------
    # Attributes

    attr_accessible :email, :password, :password_confirmation, :remember_me,
      :name, :nickname, :image

    #--------------------------------------------------------
    # Associations

    belongs_to :rolable, :polymorphic => true

    #--------------------------------------------------------
    # Validations

    validates :email, presence: true, email: true, uniqueness: true

    #--------------------------------------------------------
    # Callbacks

    before_save{ email.downcase! }

    #--------------------------------------------------------
    # Other Macros

    devise :database_authenticatable, :registerable,
      :recoverable, :rememberable, :trackable, :validatable,
      :confirmable

    devise :omniauthable, omniauth_providers: [:facebook]

    #--------------------------------------------------------
    # Class Methods

    def person?
      self.rolable_type == "Person"
    end

    def vendor?
      self.rolable_type == "Vendor"
    end

    def self.from_omniauth(auth)
      where(auth.slice(:provider, :uid)).first_or_create do |user|
        user.email = auth.info.email
        user.password = Devise.friendly_token[0,20]
        user.rolable = V1::Person.from_omniauth(auth)
        user.confirm!
      end
    end

    def self.new_with_session(params, session)
      super.tap do |user|
        if data = session["devise.facebook_data"] && session["devise.facebook_data"]["extra"]["raw_info"]
          user.email = data["email"] if user.email.blank?
        end
      end
    end
  end
end
