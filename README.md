#Tuxedo Prototype
###An app that connects allows people to connect with a local city or town, giving the user a true taste of what a city has to offer.
####Team Members: Austin Wood, Brandon Mikulka, Ian Ker-Seymer

[Link to description of Models, Views, and Controllers](https://github.com/tuxedio/tuxedo-proto/blob/development/MODEL_README.md)

***

###Notes to devs:
  1. No one works on the master branch! Please create feature branches, and make pull requests to the master
  2. Commit frequently to make conflicts easier to deal with
  3. Start working by creating a feature branch, and make pull requests when features are completed.


###Git Workflow - Using a modified Gitflow approach
  1. Create feature branch off of development branch ```git checkout development```
  2. Pull remote changes ```git pull```
    1. Use naming convention f-<featurename> for creating feature branches, c-<name> for chores
  3. Do development in feature branch
  4. Pull any changes in development branch into the feature branch or your code might break!!!!!
  5. Make sure you pass the tests and the feature does not break any other features
  6. Push the feature branch to github (git push origin f-<featurename>)
  7. Make a Pull request to merge back into develop branch.


###Merge Rules
  1. If merging minor feature to development branch: only need one +1
  2. If merging major feature to development branch: need two +1s
  3. If merging to master: need two +1s


###Setup:
```
  bundle install
  rake db:migrate
  rake db:populate
  rake test:prepare
```


###Coding Style:
  1. Try to stay consistent in coding styles.
  2. Use 2 spaces for tabbing,
  3. Align characters when possible. (tip: use a monospaced font like Inconsolata)
  4. Naming conventions:
    1. Methods:   snake_case
    2. Classes:   CamelCase
    3. Constants: SCREAMING_SNAKE_CASE
  5. Comment about WHAT your code does, not HOW. If someone else can't understand the logic, you might want to refactor your code...
  6. For general CS knowledge, you should read [this](https://www.kernel.org/doc/Documentation/CodingStyle) (even though it does not fully apply to out application, there are abundant gems).

###Deploy to Server
  1. Make sure your current branch is being tracked by origin
    ```git push origin my-branch```
  2. Run: 
    * ```cap development deploy```
    *  ```cap master deploy```
    *  ```cap current_branch deploy```
  3. Visit the [webpage](http://107.170.226.89)
