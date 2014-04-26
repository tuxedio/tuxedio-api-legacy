require 'sshkit/dsl'

set :application, 'tuxedio'
set :scm, :git
set :repo_url, 'git@github.com:tuxedio/tuxedio-proto.git'

set :deploy_to, '/home/deploy/tuxedio'

# Set the deploy branch to the current branch
set :branch, ENV['branch'] || 'development'
set :rails_env, "production"

set :linked_files, %w{config/database.yml config/environments/production.rb}
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
