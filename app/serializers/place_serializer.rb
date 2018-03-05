class PlaceSerializer < NodeSerializer
  set_type :place
  attributes :slug, :title, :body, :properties
end
