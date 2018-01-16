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

page1 = Page.create(
  name: 'Page No. 1',
  body: 'This is a new page.',
  user: user
)


page2 = Page.create(
  name: 'Page No. 2',
  body: 'This is another new page.',
  user: user
)

page3 = Page.create(
  name: 'Page No. 3',
  body: 'This is yet another new page.',
  user: user
)

event1 = Event.create(
  name: 'Event No. 1',
  body: 'This is a new event.',
  user: user
)

event2 = Event.create(
  name: 'Event No. 2',
  body: 'This is another new event.',
  user: user
)

event3 = Event.create(
  name: 'Event No. 3',
  body: 'This is yet another new event.',
  user: user
)

vector1 = Vector.create(
  subject: event2,
  predicate: 'has_parent',
  dobject: event1
)
