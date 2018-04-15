class NodeSerializer
  include FastJsonapi::ObjectSerializer

  set_type :node
  attributes :id, :slug, :label, :title, :properties, :body, :created_at, :updated_at, :absolute_url
  has_many :edges
  has_many :edges_inverted, serializer: :edge
end
