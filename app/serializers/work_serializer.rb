class WorkSerializer < NodeSerializer
  set_type :work
  attributes :slug, :title, :properties, :body, :created_at, :updated_at
end
