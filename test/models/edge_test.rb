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

  test 'subject nodes_out includes dobject' do
    assert @allan.nodes_out.include? @meg
    refute @allan.nodes_out.include? @michael
  end

  test 'subject edges_out includes edge' do
    assert @allan.edges_out.include? @edge
    refute @allan.edges_out.include? @edge2
  end

  test 'dobject nodes_in includes subject' do
    assert @meg.nodes_in.include? @allan
    refute @meg.nodes_in.include? @michael
  end

  test 'dobject edges_in includes edge' do
    assert @meg.edges_in.include? @edge
    refute @meg.edges_in.include? @edge2
  end

end
