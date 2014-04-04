def current_git_branch
  branch = `git symbolic-ref HEAD 2> /dev/null`.strip.gsub(/^refs\/heads\//, '')
end

set :stage, :production
set :branch, current_git_branch
server '107.170.226.89', user: 'deploy', roles: %w{web app}
