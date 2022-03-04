# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'json'
require "open-uri"

Letter.destroy_all
Inbox.destroy_all
User.destroy_all

randomizer = ('a'..'z').to_a

def random_city
  url = "https://countriesnow.space/api/v0.1/countries"
  response = RestClient.get(url)
  cities = []
  array = JSON.parse(response)["data"]
  array.each do |item|
    item["cities"].each do |city|
      cities << city
    end
  end
  cities.sample
end

20.times do

  user = User.new(name:Faker::Name.unique.name,
                  email:Faker::Internet.email,
                  gender:Faker::Gender.type,
                  avatar: "https://avatars.dicebear.com/api/bottts/#{randomizer.sample(rand(1..26)).join}.svg" ,
                  password:"111111",
                  address: random_city,
                  description:Faker::Quote.most_interesting_man_in_the_world,
                  age:rand(18..40))

  user1 = User.new(name:Faker::Name.unique.name,
                  email:Faker::Internet.email,
                  gender:Faker::Gender.type,
                  avatar: "https://avatars.dicebear.com/api/bottts/#{randomizer.sample(rand(1..26)).join}.svg" ,
                  password:"111111",
                  address: random_city,
                  description:Faker::Quote.most_interesting_man_in_the_world,
                  age:rand(18..40))

  user.save!
  user1.save!

  inbox = Inbox.new(first_user:user, second_user: user1)
  inbox.save!

  rand(5..15).times do
    letter = Letter.new(sender: user, receiver: user1, inbox: inbox, content: Faker::TvShows::BojackHorseman.quote, subject: Faker::TvShows::BojackHorseman.character)
    puts "[#{letter.subject}]\t \t Letter.sent!"
    letter.save!

    letter = Letter.new(sender:user1, receiver: user, inbox: inbox,  content: Faker::TvShows::BojackHorseman.quote, subject: Faker::TvShows::BojackHorseman.character)
    puts "[#{letter.subject}]\t \t Letter sent!"
    letter.save!
  end
end
