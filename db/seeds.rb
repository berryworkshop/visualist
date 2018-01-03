# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

admin = User.new
admin.name = 'admin'
admin.email = 'admin@example.com'
admin.password = 'jehosoph'
admin.password_confirmation = 'jehosoph'
admin.admin = true
admin.save

user = User.new
user.name = 'allan'
user.email = 'user@example.com'
user.password = 'jehosoph'
user.password_confirmation = 'jehosoph'
user.admin = false
user.save
