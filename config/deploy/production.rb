set :stage,  :production
set :branch, ENV["REVISION"] || ENV["BRANCH_NAME"] || "master"
server '107.170.226.89', user: 'deploy', roles: %w{web app}
