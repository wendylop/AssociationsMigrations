# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Recipe.delete_all
Recipe.create(name: "Kartoffelhälften mit Füllung", categories:"Vegetables")
Recipe.create(name: "Mediterranes Knoblauchhähnchen", categories:"Poultry")
Recipe.create(name: "Ananas-Drink ", categories:"Drinks")
Recipe.create(name: "Kartoffeltortilla", categories:"Vegetables")
Recipe.create(name: "Eierkuchen", categories:"desserts")


