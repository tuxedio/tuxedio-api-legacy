module V1
  class Person < ActiveRecord::Base
    #--------------------------------------------------------
    # Attributes

    attr_accessor :picture_remote_url

    attr_accessible :name,
      :location,
      :bio,
      :top_choices,
      :picture_file_size,
      :picture,
      :hometown,
      :gender,
      :date_of_birth,
      :user_attributes,
      :current_adventure

    #--------------------------------------------------------
    # Associations

    has_many :adventures, dependent: :destroy
    has_many :journey_items, through: :adventures
    has_one :user, as: :rolable, dependent: :destroy

    accepts_nested_attributes_for :user

    #--------------------------------------------------------
    # Validations

    validates :bio,         presence: true, length: { maximum: 255 }
    validates :gender,      inclusion: { in: ['male', 'female'] }, allow_nil: true
    validates :hometown,    presence: false, length: { maximum: 30 }
    validates :location,    length: { maximum: 30 }
    validates :name,        presence: true, length: { maximum: 50  }

    validates_date :date_of_birth, before: Date.today, allow_nil: true

    has_attached_file :picture,
      styles: { medium: '300x300#', thumb: '100x100#' },
      default_url: ActionController::Base.helpers.asset_path('missing_avatar.jpg')

    validates_attachment_content_type :picture,
      :content_type => /^image\/(png|gif|jpeg|jpg)/,
      :message => 'Only .png .gif .jpeg .jpg images, please.'

    validates_attachment_size :picture,
      :less_than => 10.megabytes,
      :message => "Picture too large."

    #--------------------------------------------------------
    # Instance Methods

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
end
