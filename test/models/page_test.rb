require 'test_helper'

class PageTest < ActiveSupport::TestCase
  setup do
    @page = pages(:one)
  end

  test 'valid page' do
    assert @page.valid?
  end

  test 'invalid without name' do
    @page.name = nil
    refute @page.valid?, 'page should be invalid without a name'
    assert_not_nil @page.errors[:name]
  end

  test 'invalid without body' do
    @page.body = nil
    refute @page.valid?, 'page should be invalid without an body'
    assert_not_nil @page.errors[:email]
  end

  test 'invalid without user' do
    @page.user = nil
    refute @page.valid?, 'page should be invalid without a user'
    assert_not_nil @page.errors[:email]
  end

end
