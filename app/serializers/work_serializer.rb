class WorkSerializer < NodeSerializer
  set_type :work
  attributes :slug, :title, :body, :properties, :created_at, :updated_at
end
