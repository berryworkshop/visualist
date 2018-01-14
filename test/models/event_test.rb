require 'test_helper'

class EventTest < ActiveSupport::TestCase
  setup do
    @event = events(:exhibition)
  end

  test 'valid event' do
    assert @event.valid?
  end

  test 'invalid without name' do
    @event.name = nil
    refute @event.valid?, 'event should be invalid without a name'
    assert_not_nil @event.errors[:name]
  end

  test 'invalid without body' do
    @event.body = nil
    refute @event.valid?, 'event should be invalid without an body'
    assert_not_nil @event.errors[:email]
  end

end
