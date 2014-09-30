require 'factory_girl'
include FactoryGirl::Syntax::Methods

puts "Building People..."
create_list :person_with_account, 40

puts "Building Vendors/Experiences..."
40.times do
  @experience = create :experience

  4.times do
    create :experience_time, experience: @experience
  end
end
