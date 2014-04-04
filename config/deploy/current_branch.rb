def current_git_branch
  branch = `git symbolic-ref HEAD 2> /dev/null`.strip.gsub(/^refs\/heads\//, '')
end

# Set the deploy branch to the current branch
set :stage, :production
set :branch, current_git_branch

# Replace 127.0.0.1 with your server's IP address!
server '107.170.226.89', user: 'deploy', roles: %w{web app}
