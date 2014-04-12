class Customer < User
  attr_accessible :bio
  serialize       :top_choices, Array

  #validates_with TopChoicesValidator
end
