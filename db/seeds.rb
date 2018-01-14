admin = User.new
admin.name = 'admin'
admin.email = 'admin@example.com'
# TODO get passwords out of repo
admin.password = 'secretpassword'
admin.password_confirmation = 'secretpassword'
admin.admin = true
admin.save

user = User.new
user.name = 'allan'
user.email = 'user@example.com'
# TODO get passwords out of repo
user.password = 'secretpassword'
user.password_confirmation = 'secretpassword'
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
