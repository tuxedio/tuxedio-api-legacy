#Tuxedo Prototype

***

###Notes to devs:
  1. No one works on the master branch! Please create feature branches, and make pull requests to the master
  2. Commit frequently to make conflicts easier to deal with
  3. Start working by creating a feature branch, and make pull requests when features are completed.

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

###Feature Guide
   1. Create your feature branch.
   ``` git checkout -b my-feature```
   2. Write your feature, making commits often.
   ``` git commit -m "Add some functionality" ```
   3. Interactively rebase your commits to make them more logical/meaningful.
   ``` git rebase -i HEAD~5 ```
   4. Push your feature branch to remote origin.
   ``` git push origin my-feature ```
   5. Open a pull request on github.com to compare your feature and initiate code review.
