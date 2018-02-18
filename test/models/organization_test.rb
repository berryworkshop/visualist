require 'test_helper'

class OrganizationTest < ActiveSupport::TestCase
  setup do
    @organization = organizations(:culturemath)
    @user = users(:valid_user)
  end

  test 'valid organization' do
    assert @organization.valid?
  end

  test 'invalid without name' do
    @organization.name = nil
    refute @organization.valid?, 'organization should be invalid without a name'
    assert_not_nil @organization.errors[:name]
  end

  test 'invalid without body' do
    @organization.body = nil
    refute @organization.valid?, 'organization should be invalid without a body'
    assert_not_nil @organization.errors[:email]
  end

  test 'invalid without user' do
    @organization.user = nil
    refute @organization.valid?, 'organization should be invalid without a user'
    assert_not_nil @organization.errors[:email]
  end

end
