# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
User.create name: 'Super User', username: 'admin', password: 'osra', password_confirmation: 'osra'
User.create name: 'User One', username: 'user1', password: 'osra', password_confirmation: 'osra'
User.create name: 'User Two', username: 'user2', password: 'osra', password_confirmation: 'osra'
User.create name: 'Orphan Admin', username: 'orphan_admin', password: 'osra', password_confirmation: 'osra'
User.create name: 'Sponsor Admin', username: 'sponsor_admin', password: 'osra', password_confirmation: 'osra'