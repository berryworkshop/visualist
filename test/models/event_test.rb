require 'test_helper'

class EventTest < ActiveSupport::TestCase
  setup do
    @event_1 = events(:exhibition)
    @event_2 = events(:opening)
  end

  test 'valid event' do
    assert @event_1.valid?
  end

  test 'invalid without name' do
    @event_1.name = nil
    refute @event_1.valid?, 'event should be invalid without a name'
    assert_not_nil @event_1.errors[:name]
  end

  test 'invalid without body' do
    @event_1.body = nil
    refute @event_1.valid?, 'event should be invalid without a body'
    assert_not_nil @event_1.errors[:email]
  end

  test 'invalid without user' do
    @event_1.user = nil
    refute @event_1.valid?, 'event should be invalid without a user'
    assert_not_nil @event_1.errors[:email]
  end

  # test 'valid connected to another event' do

  # end

end
