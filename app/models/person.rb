class Person < ActiveRecord::Base

  #--------------------------------------------------------
  # Attributes

  attr_accessible :name, :location, :bio,
                  :top_choices, :picture_file_size, :picture,
                  :current_adventure, :top_choices

  serialize :top_choices, Array


  #--------------------------------------------------------
  # Associations

  has_many :adventures, dependent: :destroy
  has_many :journey_items, through: :adventures
  has_one :user, :as => :rolable

  #--------------------------------------------------------
  # Validations

  validates :name,          presence: true, length: { maximum: 50 }
  validates :location,      presence: true, length: { maximum: 30 }
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

end
