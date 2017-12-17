# test.rb
require_relative './_helper.rb'

class HomeTest < MiniTest::Test
  include Rack::Test::Methods

  @@api_base = '/api/'
  @@events_base = File.join @@api_base, 'events'

  def app
    Sinatra::Application
  end

  def test_home
    get '/'
    assert last_response.ok?
    assert_includes last_response.body, "Welcome to the Visualist."
  end

  def test_api_base
    get @@api_base
    assert last_response.ok?
    json_response = JSON.parse(last_response.body, symbolize_names: true)
    assert_includes json_response, :events
  end

  def test_api_events_list
    get @@events_base
    assert last_response.ok?
    json_response = JSON.parse(last_response.body, symbolize_names: true)
    [:meta, :items].each do |i|
      assert_includes json_response, i
    end

    [:total, :page, :pageSize, :pageQty].each do |i|
      assert_includes json_response[:meta], i
    end
  end
end
