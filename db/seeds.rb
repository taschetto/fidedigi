# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Manager.create email: "manager@manager.com",
               password: "12345678"

Company.create name: Faker::Company.name,
               ratio: rand(1..100),
               manager: Manager.first

User.create email: "user@user.com",
            password: "12345678"