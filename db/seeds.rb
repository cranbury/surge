User.destroy_all
Team.destroy_all

example = User.create email: "example@example.com", password: "example", password_confirmation: "example"
Team.create name: "Greater Philly", user_id: example.id


# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
