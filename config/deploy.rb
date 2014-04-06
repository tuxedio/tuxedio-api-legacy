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
  after "deploy", "deploy:migrate"
end


namespace :db do
  task :migrate do
    on roles(:app), in: :sequence do
      within "#{current_path}" do
        execute :rake, 'db:migrate RAILS_ENV=production'
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
end
