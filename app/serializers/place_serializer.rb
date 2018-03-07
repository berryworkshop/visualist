class PlaceSerializer < NodeSerializer
  set_type :place
  attributes :slug, :title, :body, :properties, :created_at, :updated_at
end
