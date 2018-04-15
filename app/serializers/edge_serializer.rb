class EdgeSerializer
  include FastJsonapi::ObjectSerializer
  set_type :edge  # optional
  attributes :subject, :predicate, :dobject, :created_at, :updated_at, :properties
end
