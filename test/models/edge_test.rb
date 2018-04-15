require 'test_helper'

class EdgeTest < ActiveSupport::TestCase
  def setup


    @allan = people(:berry_allan)
    @meg = people(:duguid_meg)
    @michael = people(:thomas_michael)

    @edge = Edge.create(
      subject: @allan,
      predicate: :has_friend,
      dobject: @meg,
      properties: {}
    )
    @edge2 = Edge.new()
  end

  test 'invalid without subject' do
    @edge.subject = nil
    refute @edge.valid?, 'edge is valid without a subject'
    assert_not_nil @edge.errors[:name], 'no validation error for subject missing'
  end

  test 'invalid without predicate' do
    @edge.predicate = nil
    refute @edge.valid?, 'edge is valid without a predicate'
    assert_not_nil @edge.errors[:name], 'no validation error for predicate missing'
  end

  test 'invalid without dobject' do
    @edge.dobject = nil
    refute @edge.valid?, 'edge is valid without a direct object'
    assert_not_nil @edge.errors[:name], 'no validation error for direct object missing'
  end

  test 'valid with both subject and dobject' do
    assert @edge.valid?, 'edge is not valid without both a subject and a dobject'
  end

  test 'subject dobjects includes dobject' do
    assert @allan.dobjects.include? @meg
    refute @allan.dobjects.include? @michael
  end

  test 'subject dobject_relations includes edge' do
    assert @allan.dobject_relations.include? @edge
    refute @allan.dobject_relations.include? @edge2
  end

  test 'dobject subjects includes subject' do
    assert @meg.subjects.include? @allan
    refute @meg.subjects.include? @michael
  end

  test 'dobject subject_relations includes edge' do
    assert @meg.subject_relations.include? @edge
    refute @meg.subject_relations.include? @edge2
  end

end
