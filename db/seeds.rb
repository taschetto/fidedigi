# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

if Company.any? then

  # Company
  manager = Manager.create email: Faker::Internet.safe_email,
                           password: "12345678"

  company = Company.create name: Faker::Company.name,
                           ratio: rand(1..100),
                           manager: manager,
                           minimum_value: 10

  Promotion.create company: company,
                   expiration: Faker::Date.forward(100),
                   value: rand(3000..60000),
                   availability: rand(1..100),
                   title: Faker::Commerce.product_name,
                   description: Faker::Lorem.paragraph,
                   image: Faker::Avatar.image

  Promotion.create company: company,
                   expiration: Faker::Date.forward(100),
                   value: rand(3000..60000),
                   availability: rand(1..100),
                   title: Faker::Commerce.product_name,
                   description: Faker::Lorem.paragraph,
                   image: Faker::Avatar.image

  Clerk.create email: Faker::Internet.safe_email,
               password: "12345678",
               company: company

  Clerk.create email: Faker::Internet.safe_email,
               password: "12345678",
               company: company

  # Another company

  manager = Manager.create email: Faker::Internet.safe_email,
                           password: "12345678"

  company = Company.create name: Faker::Company.name,
                           ratio: rand(1..100),
                           manager: manager,
                           minimum_value: 50

  Promotion.create company: company,
                   expiration: Faker::Date.forward(100),
                   value: rand(3000..60000),
                   availability: rand(1..100),
                   title: Faker::Commerce.product_name,
                   description: Faker::Lorem.paragraph,
                   image: Faker::Avatar.image

  Promotion.create company: company,
                   expiration: Faker::Date.forward(100),
                   value: rand(3000..60000),
                   availability: rand(1..100),
                   title: Faker::Commerce.product_name,
                   description: Faker::Lorem.paragraph,
                   image: Faker::Avatar.image

  Promotion.create company: company,
                   expiration: Faker::Date.forward(100),
                   value: rand(3000..60000),
                   availability: rand(1..100),
                   title: Faker::Commerce.product_name,
                   description: Faker::Lorem.paragraph,
                   image: Faker::Avatar.image

  Clerk.create email: Faker::Internet.safe_email,
               password: "12345678",
               company: company

 # Yet another company

  manager = Manager.create email: Faker::Internet.safe_email,
                           password: "12345678"

  company = Company.create name: Faker::Company.name,
                           ratio: rand(1..100),
                           manager: manager,
                           minimum_value: 30

  Promotion.create company: company,
                   expiration: Faker::Date.forward(100),
                   value: rand(3000..60000),
                   availability: rand(1..100),
                   title: Faker::Commerce.product_name,
                   description: Faker::Lorem.paragraph,
                   image: Faker::Avatar.image

  Clerk.create email: Faker::Internet.safe_email,
               password: "12345678",
               company: company

  # Some users :)

  User.create email: Faker::Internet.safe_email,
              password: "12345678"

  User.create email: Faker::Internet.safe_email,
              password: "12345678"
end