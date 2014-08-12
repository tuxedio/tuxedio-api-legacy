include FactoryGirl::Syntax::Methods

namespace :db do
  desc "Populate database with sample data"
  task populate: :environment do
    100.times {FactoryGirl.create(:person)}
    100.times {FactoryGirl.create(:vendor)}
    100.times {FactoryGirl.create(:experience)}
    100.times {FactoryGirl.create(:experience_time)}
  end
end
