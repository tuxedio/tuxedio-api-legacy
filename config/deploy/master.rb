set :stage,  :production
set :branch, 'master'

# Replace 127.0.0.1 with your server's IP address!
server '107.170.226.89', user: 'deploy', roles: %w{web app}
