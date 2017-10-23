# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

puppies = Charity.create(name: "Pup.Org", description: "we love puppies", url: "https://www.google.com/", contact: "Natalie", phone: "555-555-5555", verified: true)

save_puppy = Task.create(charity: puppies, title: "Save a puppy", description: "save a puppy from a tree", address: "maple street", category: "animals", date: Time.now.strftime("%m-%d-%y"), lat: 40.7053417, lng: -74.01382799999999, max_people: 3)

david = User.create(username: "david", password: "1234", email: "david@david.com", phone: "777-777-7777" )

user_task = UserTask.create(user: david, task: save_puppy)

save_another_dog = Task.create(charity: puppies, title: "Save a another puppy", description: "save a puppy from a bridge", address: "apple street", category: "animals", date: Time.now.strftime("%m-%d-%y"), lat: 40.767778, lng: -73.9718335, max_people: 3)
