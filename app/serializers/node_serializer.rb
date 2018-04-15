class NodeSerializer
  include FastJsonapi::ObjectSerializer

  set_type :node
  attributes :slug, :label, :title, :properties, :body, :created_at, :updated_at
    # :subject_relation_ids,
    # :subject_relations,
    # :subjects#,
    # :subjects, :dobjects,
    # :dobject_relations, :subject_relations
  # has_many :subjects
  # has_many :dobjects
  has_many :dobject_relations
  has_many :subject_relations
end
