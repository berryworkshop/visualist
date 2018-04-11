require 'test_helper'

class EdgeTest < ActiveSupport::TestCase
  def setup
    @edge = edges(:allan_friend_meg)
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

end
