require 'test_helper'

class UserTest < ActiveSupport::TestCase
  setup do
    @user = users(:valid_user)
  end

  test 'valid user' do
    assert @user.valid?
  end

  test 'invalid without name' do
    @user.name = nil
    refute @user.valid?, 'user should be invalid without a name'
    assert_not_nil @user.errors[:name]
  end

  test 'invalid without email' do
    @user.email = nil
    refute @user.valid?, 'user should be invalid without an email'
    assert_not_nil @user.errors[:email]
  end

  test 'invalid without password_digest' do
    @user.password_digest = nil
    refute @user.valid?, 'user should be invalid without a password digest'
    assert_not_nil @user.errors[:email]
  end

  # test '#posted events' do
  #   assert_equal 2, @user.events.size
  # end
end
