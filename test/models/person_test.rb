require 'test_helper'

class PersonTest < ActiveSupport::TestCase
  setup do
    @person = people(:allan)
    @user = users(:valid_user)
  end

  test 'valid person' do
    assert @person.valid?
  end

  test 'invalid without name' do
    @person.name = nil
    refute @person.valid?, 'person should be invalid without a name'
    assert_not_nil @person.errors[:name]
  end

  test 'invalid without body' do
    @person.body = nil
    refute @person.valid?, 'person should be invalid without a body'
    assert_not_nil @person.errors[:email]
  end

  test 'invalid without user' do
    @person.user = nil
    refute @person.valid?, 'person should be invalid without a user'
    assert_not_nil @person.errors[:email]
  end

  test '#users' do
    assert_equal 2, @user.events.size
  end

end
