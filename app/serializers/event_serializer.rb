class EventSerializer < NodeSerializer
  set_type :event
  attributes :slug, :title, :body, :properties, :created_at, :updated_at
end
