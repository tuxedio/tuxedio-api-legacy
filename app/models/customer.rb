class Customer < User
  attr_accessible :bio
  serialize :top_choices, Array
end
