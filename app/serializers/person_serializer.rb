class PersonSerializer < NodeSerializer
  set_type :person
  attributes :slug, :title, :body, :properties, :created_at, :updated_at
end
