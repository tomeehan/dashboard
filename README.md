# README

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

1. `Rails Console`
2. `Type.connection`
3. `Type.create(name: "My Category Name")

