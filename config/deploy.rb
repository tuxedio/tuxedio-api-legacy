require 'sshkit/dsl'

set :application, 'tuxedo'
set :scm, :git
set :repo_url, 'git@github.com:tuxedio/tuxedo-proto.git'

set :deploy_to, '/home/deploy/tuxedo'

# Set the deploy branch to the current branch
set :branch, ENV['branch'] || 'development'
set :rails_env, "production"

set :linked_files, %w{config/database.yml}
set :linked_dirs, %w{bin log tmp/pids tmp/cache tmp/sockets vendor/bundle public/system}

namespace :deploy do

  desc 'Restart application'
  task :restart do
    on roles(:app), in: :sequence, wait: 5 do
      execute :touch, release_path.join('tmp/restart.txt')
    end
  end

  after :finishing, 'deploy:cleanup'
end

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

  desc 'kill pgsql users so database can be dropped'
  task :kill_postgres_connections do
    on roles(:app), in: :sequence do
      execute :psql, '-c "SELECT procpid, pg_terminate_backend(procpid) as terminated FROM pg_stat_activity WHERE procpid <> pg_backend_pid();" -d production-tux'
    end
  end
end



