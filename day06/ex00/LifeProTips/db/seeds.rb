# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.new(username: "aboba", email: "aboba@g.com", password: "11111111", password_confirmation: "11111111").save
User.new(username: "abibas", email: "abibas@g.com", password: "22222222", password_confirmation: "22222222").save
User.new(username: "noadmin", email: "noadmin@g.com", password: "21212121", password_confirmation: "21212121").save