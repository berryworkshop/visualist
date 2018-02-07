admin = User.create(
  name: 'admin',
  email: 'admin@example.com',
  password: 'secretpassword',
  password_confirmation: 'secretpassword',
  admin: true
)

page_about = Page.create(
  name: 'About',
  body: 'This is information about the Visualist.',
  user: admin
)

culturemath = Organization.create(
  type: Organization,
  name: 'Culture/Math',
  body: 'Culture/Math does great things for artists in Chicago.',
  user: admin,
  categories: ['association']
)

allan = Person.create(
  type: 'Person',
  name: 'Berry',
  name_given: 'Allan James',
  name_suffix: nil,
  body: 'Allan helped to make this site.',
  user: admin,
  categories: ['artist', 'programmer']
)

meg = Person.create(
  type: Person,
  name: 'Duguid',
  name_given: 'Meg',
  name_suffix: nil,
  body: 'Meg does shows around Chicago, and is a founding member of Culture/Math.',
  user: admin,
  categories: [
    'artist',
    'curator'
  ]
)

michael = Person.create(
  type: Person,
  name: 'Thomas',
  name_given: 'Michael',
  name_suffix: nil,
  body: 'Michael does shows around Chicago, and is a founding member of Culture/Math.',
  user: admin,
  categories: [
    'artist',
    'curator'
  ]
)

mick = Person.create(
  type: Person,
  name: 'Reed',
  name_given: 'Michael',
  name_suffix: 'Esq.',
  body: 'Mick is a really great lawyer.',
  user: admin,
  categories: nil
)

allan_has_friend_meg = Association.create(
  subject: allan,
  predicate: :has_friend,
  dobject: meg,
)

allan_has_friend_michael = Association.create(
  subject: allan,
  predicate: :has_friend,
  dobject: michael,
)

allan_has_friend_mick = Association.create(
  subject: allan,
  predicate: :has_friend,
  dobject: mick,
)
