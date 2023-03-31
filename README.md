# README

This is Ruby on Rails app. Representation of the Quotes app.
Inspiration came from the website [BrainyQuote](https://www.brainyquote.com)

***
### Implemented features
* Bootstrap 5.2 installed: [instructions](https://dev.to/songta17/rails-6-with-bootstrap-5-5c08)
* CRUD operations for Quotes obj
* CRUD operations for Author obj
* CRUD operations for Category obj
* One to Many relationship for Author-Quote
* Established many-to-many relationship: Quotes-Categories
* UI representation for Quotes CRUD operations
* Added users model: CRUD operations
* Added auth support to the project
* CRUD operations for Users
* Added bootstrap for Users: sign in/out

***
### Steps for running app

* Ruby version - 2.7.5
* Rails version - 6.1.6.1
* Database initialization
* Database creation
* How to run the test suite
* Services (job queues, cache servers, search engines, etc.)
* Deployment instructions

***
### TODO:
1. Add admin functionality?
2. Add username and images to the users?
3. Add author fast search selection for Quotes create action
4. Add duplication mechanism for quotes. How make it?
5. Add search func/service across all quotes and authors
6. Auto upload for Authors and Quotes from json file
7. Prettify selection for author and categories

***
### Run app
| CMD                       | Description                      |
|---------------------------|----------------------------------|
| `rails db:seed`           | seed Database with mock data     |
| `rails db:migrate`        | apply all migrations on Database |
| `rails s`                 | start server                     |
| `rails c`                 | start console                    |
| `rails routes --expanded` | see all routes in console        |
