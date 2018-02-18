require 'test_helper'

class AssociationTest < ActiveSupport::TestCase
  setup do
    allan = people(:allan)
    mick = people(:mick)
    @association = Association.create(
      subject: allan,
      predicate: "has_friend",
      dobject: mick,
    )
  end

  test 'valid association' do
    assert @association.valid?
  end

  test 'invalid without subject' do
    @association.subject = nil
    refute @association.valid?, 'association should be invalid without a subject'
    assert_not_nil @association.errors[:name]
  end

  test 'invalid without predicate' do
    @association.predicate = nil
    refute @association.valid?, 'association should be invalid without a predicate'
    assert_not_nil @association.errors[:name]
  end

  test 'invalid without direct object' do
    @association.dobject = nil
    refute @association.valid?, 'association should be invalid without a  direct object'
    assert_not_nil @association.errors[:name]
  end

end
