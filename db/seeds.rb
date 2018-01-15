admin = User.create(
  name: 'admin',
  email: 'admin@example.com',
  password: 'secretpassword',
  password_confirmation: 'secretpassword',
  admin: true
)

user = User.create(
  name: 'allan',
  email: 'user@example.com',
  password: 'secretpassword',
  password_confirmation: 'secretpassword',
  admin: false
)

page1 = Page.new
page1.name = 'Page No. 1'
page1.body = 'This is a new page.'
page1.user = user
page1.save

page2 = Page.new
page2.name = 'Page No. 2'
page2.body = 'This is another new page.'
page2.user = user
page2.save

page3 = Page.new
page3.name = 'Page No. 3'
page3.body = 'This is yet another new page.'
page3.user = user
page3.save

event1 = Event.new
event1.name = 'Event No. 1'
event1.body = 'This is a new event.'
event1.user = user
event1.save

event2 = Event.new
event2.name = 'Event No. 2'
event2.body = 'This is another new event.'
event2.user = user
event2.save

event3 = Event.new
event3.name = 'Event No. 3'
event3.body = 'This is yet another new event.'
event3.user = user
event3.save
