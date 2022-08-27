# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create(first_name: "Denis", last_name: "Lafontant", phone: "111-111-1111", email: "denis@denis.me", password: "denis123456", gender: "male",  birthdate: "Mar-18-1985")
User.create(first_name: "Mohammed", last_name: "Atef", phone: "111-111-1112", email: "atef@atef.me", password: "atef123456", gender: "male",  birthdate: "Mar-18-1985")
User.create(first_name: "Victor", last_name: "Pacheco", phone: "111-111-1113", email: "vic@vic.me", password: "vic123456", gender: "male",  birthdate: "Mar-18-1985")