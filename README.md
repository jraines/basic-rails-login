Rails app get started steps

##Getting Started
- rails new myrailsblog
- cd myrailsblog
- add anything particular to your needs / project to .gitignore - Rails already ignores your database & a few other files by default.
- git init
- git add .
- git commit initial commit
- *If you never have, look at this commit on github after pushing it up, and read it.  The whole thing.  The files generated up front are key players in the conventions of Rails, and there are good comments in them explaining their contents and purposes.* 

##Creating a resource 

- *You won't do this every time you add a model and/or controller, but it's another good way to get a feel for some of the important conventions of Rails:  models, controllers, migrations, helpers, RESTful routes, the asset pipeline.*
- `rails generate resource User`
- run `rake routes` to view the list of routes set up by the new `resources :users` line in your routes file.
- Edit the migration to define the schema for the users table inside the `change` method.
- `rake db:migrate`
- use console to create test users

##Defining a resource
- Implement the actions you need in your controller (see `rake routes` for the controller actions which map to particular paths, HTTP verbs, and Rails' URL helper methods.  Note that the ones which need an id in the URL also need an id (or the whole object) to be given to the helper method for it to create that URL, e.g. `edit_user_path(current_user)`
- Use instance variables to store & work with models or other objects & data that you will also need your associated view to have access to.
- Controller actions, by default, render a view in their corresponding folder in `app/views/<resource-name>s/` with a name corresponding to the action (`index.html.erb`).
- Pick one of your actions & set it as your root route in routes.rb
- run `rails server` to start the app

##Notes
- define helpers in ApplicationHelper to make them available to all Controllers & Views (e.g. current_user)
- to make them available in controllers, you can `include ApplicationHelper` them in ApplicationController.  Understand exactly what this (importing a module) does.
- - if you change the routes file, you need to restart the server

