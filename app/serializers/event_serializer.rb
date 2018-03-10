class EventSerializer < NodeSerializer
  set_type :event
  attributes :slug, :title, :properties, :body, :created_at, :updated_at
end
