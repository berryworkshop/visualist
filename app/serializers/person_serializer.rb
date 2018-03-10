class PersonSerializer < NodeSerializer
  set_type :person
  attributes :slug, :title, :properties, :body, :created_at, :updated_at
end
