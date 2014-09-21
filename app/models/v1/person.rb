class V1::Person < ActiveRecord::Base

  #--------------------------------------------------------
  # Attributes

  attr_accessible :name, :location, :bio,
                  :top_choices, :picture_file_size, :picture,
                  :current_adventure, :top_choices

  attr_accessor :picture_remote_url

  serialize :top_choices, Array


  #--------------------------------------------------------
  # Associations

  has_many :adventures, dependent: :destroy
  has_many :journey_items, through: :adventures
  has_one :user, :as => :rolable, class_name: 'V1::User'

  #--------------------------------------------------------
  # Validations

  validates :name,          presence: true, length: { maximum: 50 }
  validates :location,      length: { maximum: 30 }
  validates :gender,        inclusion: { in: ['male', 'female'] }, allow_nil: true
  validates :top_choices,   choice: true, on: :update
  validates :hometown,      presence: false, length: { maximum: 30 }


  validates_date :date_of_birth, allow_nil: true

  # Eventually refactor this and move this logic to production.rb
  if Rails.env == 'production'
    has_attached_file :picture, :styles => { medium: "300x300#", thumb: "100x100#" }, default_url: 'missing_avatar.jpg'
  else
    has_attached_file :picture, :styles => { medium: "300x300#", thumb: "100x100#" }, default_url: ActionController::Base.helpers.asset_path('missing_avatar.jpg')
  end

  validates_attachment_content_type :picture,
    :content_type => /^image\/(png|gif|jpeg|jpg)/,
    :message => 'Only .png .gif .jpeg .jpg images, please.'

  validates_attachment_size :picture,
    :less_than => 10.megabytes,
    :message => "Picture too large."

  #--------------------------------------------------------
  # Instance Methods

  def current_adventure(adventure_id)
    if self.adventures.count > 0
      if Adventure.exists?(adventure_id)
        Adventure.find(adventure_id)
      else
        self.adventures.last
      end
    end
  end

  def picture_remote_url=(url_value)
    self.picture = open(url_value, :allow_redirections => :safe)
    picture_remote_url = URI.parse(url_value)
  end

  #--------------------------------------------------------
  # Class Methods

  def self.from_omniauth(auth)
    info = auth.extra.raw_info

    self.create do |person|
      person.date_of_birth = Date.parse(info.birthday)
      person.facebook_link = info.link
      person.gender = info.gender
      person.hometown = info.hometown.name
      person.picture_remote_url = auth.info.image
      person.locale = info.locale
      person.location = info.location.name
      person.name = info.name
    end
  end
end
