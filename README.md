# README

Minibarra Dashboard is a dashboard for the team at [Minibarra](http://www.minibarra.com). 

We post links from great articles/podcasts/books we've read, and share our notes with the team. 

In the next week, I'll be adding the actual dashboard with our marketing metrics. 

Here it is in production: 
[https://ancient-savannah-16969.herokuapp.com](https://ancient-savannah-16969.herokuapp.com)

You're welcome to sign up, read through, and contribute (as long as it's useful)

Minibarra Dashboard is running:

* Ruby 2.3.0

* Rails 5

* PostreSQL

To run the dashboard, run: 

1. `bundle install`
2. `rake db:create`
3. `rake db:migrate`
4. `rails server`

Note: Post categories have to be created mannually through the Rails console. 

1. `rails console`
2. `Type.connection`
3. `Type.create(name: "My Category Name")`

