berry_allan = Person.create(
  type: 'Person',
  slug: 'berry_allan',
  title: 'Berry, Allan',
  body: 'Allan is awesome.',
  properties: {}
)

duguid_meg = Person.create(
  type: 'Person',
  slug: 'duguid_meg',
  title: 'Duguid, Meg',
  body: 'Meg is magnificent.',
  properties: {}
)

thomas_michael = Person.create(
  type: 'Person',
  slug: 'thomas_michael',
  title: 'Thomas, Michael',
  body: 'Michael is magical.',
  properties: {}
)

wood_grant = Person.create(
  type: 'Person',
  slug: 'wood_grant',
  title: 'Wood, Grant',
  body: 'A great American artist.',
  properties: {}
)

culture_math = Organization.create(
  type: 'Organization',
  slug: 'culture_math',
  title: 'Culture/Math',
  body: 'Culture/Math is great.',
  properties: {}
)

aic = Organization.create(
  type: 'Organization',
  slug: 'aic',
  title: 'Art Institute of Chicago',
  body: 'Chicago\'s crown jewel.',
  properties: {}
)

chicago = Place.create(
  type: 'Place',
  slug: 'chicago',
  title: 'Chicago',
  body: 'The Windy City.',
  properties: {}
)

grant_park = Place.create(
  type: 'Place',
  slug: 'grant_park',
  title: 'Grant Park',
  body: 'The great lawn of Chicago.',
  properties: {}
)

pilsen = Place.create(
  type: 'Place',
  slug: 'pilsen',
  title: 'Pilsen',
  body: 'The best neighborhood for tacos.',
  properties: {}
)

american_gothic = Work.create(
  type: 'Work',
  slug: 'american_gothic',
  title: 'American Gothic',
  body: 'A nice painting of two lovely people.',
  properties: {}
)

visualist = Work.create(
  type: 'Work',
  slug: 'visualist',
  title: 'The Visualist',
  body: 'Chicago\'s Visual Arts Calendar.',
  properties: {}
)

visualist = Page.create(
  type: 'Page',
  slug: 'about',
  title: 'About The Visualist',
  body: 'The Visualist connects Chicago with its art.',
  properties: {}
)


allan_friend_meg = Edge.create(
  # subject: berry_allan,
  predicate: :has_friend,
  # dobject: duguid_meg,
  properties: {}
)

meg_friend_allan = Edge.create(
  # subject: duguid_meg,
  predicate: :has_friend,
  # dobject: berry_allan,
  properties: {}
)

allan_friend_michael = Edge.create(
  # subject: berry_allan,
  predicate: :has_friend,
  # dobject: thomas_michael,
  properties: {}
)

meg_spouse_michael = Edge.create(
  # subject: duguid_meg,
  predicate: :has_spouse,
  # dobject: thomas_michael,
  properties: {}
)

americangothic_own_aic = Edge.create(
  # subject: american_gothic,
  predicate: :has_owner,
  # dobject: aic,
  properties: {}
)

allan_lives_pilsen = Edge.create(
  # subject: american_gothic,
  predicate: :has_place_lived,
  # dobject: pilsen,
  properties: {}
)

admin = User.create(
  name: 'Administrator',
  email: 'admin@example.com'
)
