class EventSerializer < NodeSerializer
  set_type :event
  attributes :slug, :title, :body, :properties
end
