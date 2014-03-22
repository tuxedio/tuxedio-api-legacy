#Tuxedo Prototype

***

###Notes to devs:
  1. No one works on the master branch! Please create feature branches, and make pull requests to the master
  2. Commit frequently to make conflicts easier to deal with
  3. Make sure you fork copy of repo and make pull requests when features are completed.

###Git Workflow - Using a modified Gitflow approach
  1. Create a develop branch
  2. Create feature branch off of develop
    1. Use naming convention f-<featurename> for creating feature branches.
  3. Do development in feature branch
  4. Merge any changes in develop branch into the feature branch
  5. Check everything works
  6. Push the feature branch to github (git push origin f-<featurename>)
  7. Make a Pull request to merge back into develop branch.

###Setup:
```
  bundle install
  rake db:migrate
  rake test:prepare
```
