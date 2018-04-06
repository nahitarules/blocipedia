# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require 'random_data'

5.times do
    user = User.create!(
        email: Faker::Internet.email,
        password: Faker::Internet.password,
        )
      end
    users = User.all


10.times do
    Wiki.create!(
        title: Faker::Lorem.sentence,
        body: Faker::Lorem.paragraph,
        user: User.all.sample
        )
      end
      wikis = Wiki.all

      # Create an admin member
      admin = User.create!(
        email:    'admin@example.com',
        password: 'helloworld',
        role:     'admin'
        )

      #Create a standard member
      member = User.create!(
        email:    'member@example.com',
        password: 'helloworld'
        )

      #Create a premium member
      premium = User.create!(
          email:    'premium@example.com',
          password: 'helloworld',
          role:     'premium'
        )

puts "Seed finished"
puts "#{User.count} users created"
puts "#{Wiki.count} wikis created"
