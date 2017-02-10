# Specifications for the Sinatra Assessment

Specs:
- [x] Use Sinatra to build the app
- [x] Use ActiveRecord for storing information in a database -> see gem and object relationships
- [x] Include more than one model class (list of model class names e.g. User, Post, Category) -> see User and Item
- [x] Include at least one has_many relationship (x has_many y e.g. User has_many Posts) -> see has_many in User class
- [x] Include user accounts -> there is a login view and controller actions that allow logins
- [x] Ensure that users can't modify content created by other users -> controller action checks against ids
- [x] Include user input validations -> User has validates_presence_of and item controller action checks against ""
- [x] Display validation failures to user with error message (example form URL e.g. /posts/new) -> Rack Flash
- [x] Your README.md includes a short description, install instructions, a contributors guide and a link to the license for your code

Confirm
- [x] You have a large number of small Git commits -> 60+ commits
- [x] Your commit messages are meaningful -> they have pertinent descriptions
- [x] You made the changes in a commit that relate to the commit message
- [x] You don't include changes in a commit that aren't related to the commit message
