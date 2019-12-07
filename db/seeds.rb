#seed data to work with 

#create 2 users
sam = User.create(name: "Sam", email: "samsmith@gmail.com", password: "password")
sherry= User.create(name: "Carol", email: "carol@gmail.com", password: "password")

Plant.create(name: "Pathos", water: "low". light: "low to medium", price: "20.99", greenhouse: "Planterina")
Plant.create(name: "ZZ Plant", water: "low". light: "low", price: "29.99", greenhouse: "Dan's Nursery")