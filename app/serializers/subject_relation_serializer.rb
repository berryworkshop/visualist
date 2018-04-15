class SubjectRelationSerializer < EdgeSerializer
  set_type :subject_relation
  attributes :subject, :predicate, :dobject_id, :created_at, :updated_at, :properties
end
