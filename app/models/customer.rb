class Customer < User
  attr_accessible :bio
  serialize       :top_choices, Array

  validates       :user_role, presence: true, format: { with: /Customer\z/ }
  validates_with  TopChoicesValidator

  def proper_user_role?
    user_role == "Customer"
  end
end
