# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

berry_allan = Person.create(
  type: 'Person',
  slug: 'berry_allan',
  title: 'Berry, Allan',
  body: 'Allan is awesome.'
)

duguid_meg = Person.create(
  type: 'Person',
  slug: 'duguid_meg',
  title: 'Duguid, Meg',
  body: 'Meg is magnificent.'
)

thomas_michael = Person.create(
  type: 'Person',
  slug: 'thomas_michael',
  title: 'Thomas, Michael',
  body: 'Michael is magical.'
)

wood_grant = Person.create(
  type: 'Person',
  slug: 'wood_grant',
  title: 'Wood, Grant',
  body: 'A great American artist.'
)

culture_math = Organization.create(
  type: 'Organization',
  slug: 'culture_math',
  title: 'Culture/Math',
  body: 'Culture/Math is great.'
)

aic = Organization.create(
  type: 'Organization',
  slug: 'aic',
  title: 'Art Institute of Chicago',
  body: 'Chicago\'s crown jewel.'
)

chicago = Place.create(
  type: 'Place',
  slug: 'chicago',
  title: 'Chicago',
  body: 'The Windy City.'
)

grant_park = Place.create(
  type: 'Place',
  slug: 'grant_park',
  title: 'Grant Park',
  body: 'The great lawn of Chicago.'
)

pilsen = Place.create(
  type: 'Place',
  slug: 'pilsen',
  title: 'Pilsen',
  body: 'The best neighborhood for tacos.'
)

american_gothic = Work.create(
  type: 'Work',
  slug: 'american_gothic',
  title: 'American Gothic',
  body: 'A nice painting of two lovely people.'
)

visualist = Work.create(
  type: 'Work',
  slug: 'visualist',
  title: 'The Visualist',
  body: 'Chicago\'s Visual Arts Calendar.'
)

allan_friend_meg = Edge.create(
  # subject: berry_allan,
  predicate: :has_friend,
  # dobject: duguid_meg
)

meg_friend_allan = Edge.create(
  # subject: duguid_meg,
  predicate: :has_friend,
  # dobject: berry_allan
)

allan_friend_michael = Edge.create(
  # subject: berry_allan,
  predicate: :has_friend,
  # dobject: thomas_michael
)

meg_spouse_michael = Edge.create(
  # subject: duguid_meg,
  predicate: :has_spouse,
  # dobject: thomas_michael
)

americangothic_own_aic = Edge.create(
  # subject: american_gothic,
  predicate: :has_owner,
  # dobject: aic
)

allan_lives_pilsen = Edge.create(
  # subject: american_gothic,
  predicate: :has_place_lived,
  # dobject: pilsen
)
