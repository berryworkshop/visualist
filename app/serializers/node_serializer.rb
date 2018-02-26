class NodeSerializer
  include FastJsonapi::ObjectSerializer
  set_type :node  # optional
  attributes :type, :slug, :title, :body, :properties
  # has_many :nodes_out, :nodes_in, :edges_out, :edges_in
end
