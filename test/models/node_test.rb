require 'test_helper'

class NodeTest < ActiveSupport::TestCase
  def setup
    @node = nodes(:valid_node)
  end

  test 'valid node' do
    assert @node.valid?
  end

  test 'invalid without title' do
    @node.title = nil
    refute @node.valid?, 'user is valid without a title'
    assert_not_nil @node.errors[:name], 'no validation error for title present'
  end

  test 'invalid without slug' do
    @node.slug = nil
    refute @node.valid?, 'user is valid without a slug'
    assert_not_nil @node.errors[:name], 'no validation error for slug present'
  end

  test 'invalid without properties' do
    @node.properties = nil
    refute @node.valid?, 'user is valid without properties'
    assert_not_nil @node.errors[:name], 'no validation error for properties present'
  end

  test 'invalid without json properties' do
    @node.properties = 'blurg: flarg'
    refute @node.valid?, 'user is valid without json properties'
    assert_not_nil @node.errors[:name], 'no validation error for non-json properties present'
  end
end
