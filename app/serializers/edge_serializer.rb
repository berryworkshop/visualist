class EdgeSerializer
  include FastJsonapi::ObjectSerializer

  set_type :edge
  attributes :id, :subject, :predicate, :dobject, :created_at, :updated_at, :properties, :absolute_url
end
