set :stage,  :production
set :branch, 'development'
server '107.170.226.89', user: 'deploy', roles: %w{web app}
