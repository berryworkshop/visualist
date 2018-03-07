class NodeSerializer
  include FastJsonapi::ObjectSerializer
  set_type :node  # optional
  attributes :slug, :title, :body, :properties, :created_at, :updated_at
  # has_many :nodes_out, :nodes_in, :edges_out, :edges_in
end
