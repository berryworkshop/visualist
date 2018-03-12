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
    assert_not_nil @node.errors[:name], 'no validation error for title missing'
  end

  test 'invalid without slug' do
    @node.slug = nil
    refute @node.valid?, 'user is valid without a slug'
    assert_not_nil @node.errors[:name], 'no validation error for slug missing'
  end

  test 'invalid with nil properties' do
    @node.properties = nil
    refute @node.valid?, 'user is valid without properties'
    assert_not_nil @node.errors[:name], 'no validation error for properties missing'
  end

  test 'valid with existing but empty properties' do
    @node.properties = '{}'
    assert @node.valid?, 'user is valid with empty properties'
  end

  test 'invalid without json properties' do
    @node.properties = 'blurg: flarg'
    refute @node.valid?, 'user is valid without json properties'
    @node.properties = '{blurg: flarg}'
    refute @node.valid?, 'user is valid without json properties'
    assert_not_nil @node.errors[:name], 'no validation error for non-json properties present'
  end

  test 'valid with valid website' do
    @node.properties = '{"websites": [{"url": "http://example.com"}]}'
    assert @node.valid?, 'user is invalid with a valid website'
  end

  test 'valid with multiple websites' do
    @node.properties = '{"websites": [
      {"url": "http://example.com"},
      {"url": "http://google.com"}]}'
    assert @node.valid?, 'user is invalid with a valid website'
  end

  test 'invalid with incorrect website fields' do
    @node.properties = '{"websites": [
      {
        "url": "http://example.com",
        "blarg": "flaggleblaggle"
      }
    ]}'
    refute @node.valid?, 'user is valid with incorrect website fields'
  end

  test 'invalid without website url field' do
    @node.properties = '{"websites": [
      {}
    ]}'
    refute @node.valid?, 'user is valid without website url field'
  end
end
