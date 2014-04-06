#------------------------------------
# Database Methods

namespace :db do

  task :migrate do
    on roles(:app), in: :sequence do
      within "#{current_path}" do
        execute :rake, 'db:migrate RAILS_ENV=production'
      end
    end
  end

  task :populate do
    on roles(:app), in: :sequence do
      within "#{current_path}" do
        execute :rake, 'db:populate RAILS_ENV=production'
      end
    end
  end

  task :reset do
    on roles(:app), in: :sequence do
      within "#{current_path}" do
        execute :rake, 'db:reset RAILS_ENV=production'
      end
    end
  end

  task :drop do
    on roles(:app), in: :sequence do
      within "#{current_path}" do
        execute :rake, 'db:drop RAILS_ENV=production'
      end
    end
  end

  task :create do
    on roles(:app), in: :sequence do
      within "#{current_path}" do
        execute :rake, 'db:create RAILS_ENV=production'
      end
    end
  end
