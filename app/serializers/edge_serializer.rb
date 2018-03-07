class EdgeSerializer
  include FastJsonapi::ObjectSerializer
  set_type :edge  # optional
  attributes :predicate, :created_at, :updated_at #, :properties

  # belongs_to :subject, record_type: :node
  # belongs_to :dobject, record_type: :node
end
