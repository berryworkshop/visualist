class DobjectRelationSerializer < EdgeSerializer
  set_type :dobject_relation
  attributes :subject_id, :predicate, :dobject, :created_at, :updated_at, :properties
end
