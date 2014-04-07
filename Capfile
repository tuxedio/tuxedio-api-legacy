# Load DSL and Setup Up Stages
require 'capistrano/setup'

# Includes default deployment tasks
require 'capistrano/deploy'

require 'capistrano/bundler'
require 'capistrano/rails'

#RVM
require 'capistrano/rvm'

set :rvm_type, :user
set :rvm_ruby_version, '2.1.1'

# Loads custom tasks from `lib/capistrano/tasks' if you have any defined.
Dir.glob('lib/capistrano/tasks/*.cap').each { |r| import r }
