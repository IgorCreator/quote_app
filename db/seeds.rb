# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

a1 = Author.create(first_name: "Buddha")
q1 = Quote.create(content: "Three things cannot be long hidden: the sun, the moon, and the truth.", author_id: a1.id)
q2 = Quote.create(content: "Do not dwell in the past, do not dream of the future, concentrate the mind on the present moment.", author_id: a1.id)

a2 = Author.create(first_name: "Martin", middle_name: "Luther", last_name: "King")
q3 = Quote.create(content: "Even if I knew that tomorrow the world would go to pieces, I would still plant my apple tree.", author_id: a2.id)
q4 = Quote.create(content: "You are not only responsible for what you say, but also for what you do not say.", author_id: a2.id)

a3 = Author.create(first_name: "Henry", last_name: "Ford")
q5 = Quote.create(content: "When everything seems to be going against you, remember that the airplane takes off against the wind, not with it.", author_id: a3.id)
q6 = Quote.create(content: "Obstacles are those frightful things you see when you take your eyes off your goal.", author_id: a3.id)

pwd = "123456"
admin = User.create(email: "admin@gmail.com", password: pwd, password_confirmation: pwd)
user = User.create(email: "user@gmail.com", password: pwd, password_confirmation: pwd)

category_sport = Category.create(name: "Sports")
category_travel = Category.create(name: "Travel")
category_inspiration = Category.create(name: "Inspiration")
category_gift = Category.create(name: "Gift")
category_mind = Category.create(name: "Mind")

category_inspiration.quotes << q1
category_inspiration.quotes << q2
category_inspiration.quotes << q3
category_mind.quotes << q4
category_mind.quotes << q5
category_mind.quotes << q6
