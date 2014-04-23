class Customer < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable

  before_save{ email.downcase! }

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable,
         :validatable, :confirmable

  attr_accessible :name, :email, :location, :password,
                  :password_confirmation, :bio, :top_choices, :picture

  validates :name,         presence: true, length: { maximum: 50 }
  validates :location,     presence: true, length: { maximum: 30 }
  validates :email,        presence: true, email: true, uniqueness: {case_sensitive: false }
  validates :top_choices,  choice: true, on: :update

  serialize :top_choices, Array

  has_attached_file :picture, :styles => { medium: "300x300#", thumb: "100x100#" }, default_url: ActionController::Base.helpers.asset_path('missing_avatar.jpg')
  validates_attachment_content_type :picture, content_type: /\Aimage\/.*\Z/
end
