class WorkSerializer < NodeSerializer
  set_type :work
  attributes :slug, :title, :body, :properties
end
