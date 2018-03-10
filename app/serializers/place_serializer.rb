class PlaceSerializer < NodeSerializer
  set_type :place
  attributes :slug, :title, :properties, :body, :created_at, :updated_at
end
