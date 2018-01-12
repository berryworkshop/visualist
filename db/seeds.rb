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

page1 = Page.new
page1.name = 'Page No. 1'
page1.body = 'This is a new page.'
page1.save

page2 = Page.new
page2.name = 'Page No. 2'
page2.body = 'This is another new page.'
page2.save

page3 = Page.new
page3.name = 'Page No. 3'
page3.body = 'This is yet another new page.'
page3.save

event1 = Event.new
event1.name = 'Event No. 1'
event1.body = 'This is a new event.'
event1.save

event2 = Event.new
event2.name = 'Event No. 2'
event2.body = 'This is another new event.'
event2.save

event3 = Event.new
event3.name = 'Event No. 3'
event3.body = 'This is yet another new event.'
event3.save
