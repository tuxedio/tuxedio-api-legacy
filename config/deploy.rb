set :application, 'tuxedo'
set :repo_url, 'git@github.com:tuxedio/tuxedo-proto.git'

set :deploy_to, '/home/deploy/tuxedo'

# Bonus! Colors are pretty!
def red(str)
  "\e[31m#{str}\e[0m"
end

# Set the deploy branch to the current branch
set :branch, ENV['branch'] || 'development'
set :stage, :production
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
