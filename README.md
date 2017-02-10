# README

Minibarra Dashboard is a dashboard for the team at [Minibarra](http://www.minibarra.com). 

We post links from great articles/podcasts/books we've read, and share our notes with the team. 

Here it is in production: 
[dashboard.minibarra.com](https://dashboard.minibarra.com)

You're welcome to sign up, read through, and contribute (as long as it's useful).

***
## To-do

* After launch, add a dashboard with our marketing metrics and KPI's — only available to users with a '@minibarra.com` email.
* Add password recovery.
* Add email verification.
* Make mobile friendly.
* 404, 422, and 500 error pages.

***

Minibarra Dashboard is running:

* Ruby 2.3.0

* Rails 5

* PostreSQL

***

To run the dashboard, run: 

1. `cd dashboard`
2. `bundle install`
2. `rake db:create`
3. `rake db:migrate`
4. `rails server`

Note: Post categories have to be created manually through the Rails console. 

1. `rails console`
2. `Type.connection`
3. `Type.create(name: "My Category Name")`

