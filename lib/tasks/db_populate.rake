include FactoryGirl::Syntax::Methods

namespace :db do
  desc "Populate database with sample data"
  task populate: :environment do

    puts "Building People..."
    40.times { @person = FactoryGirl.build(:person) }

    puts "Building Vendors/Experiences..."
    40.times {
      @experience = FactoryGirl.create(:experience)
      4.times {
        FactoryGirl.create(:experience_time, experience: @experience)
      }
    }

  end
end
