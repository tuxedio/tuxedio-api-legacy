#Tuxedo Prototype
###An app that connects allows people to connect with a local city or town, giving the user a true taste of what a city has to offer.
####Team Members: Austin Wood, Brandon Mikulka, Ian Ker-Seymer
***

###Notes to devs:
  1. No one works on the master branch! Please create feature branches, and make pull requests to the master
  2. Commit frequently to make conflicts easier to deal with
  3. Start working by creating a feature branch, and make pull requests when features are completed.

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

###Coding Style:
  1. Try to stay somewhat consistent in coding styles. 
  2. Use 2 spaces for tabbing, 
  3. Align characters when possible.(tip: use a monospaced font like Inconsolata) 
  4. Use snake case (Ruby Convention). 
