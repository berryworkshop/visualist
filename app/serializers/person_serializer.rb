class PersonSerializer < NodeSerializer
  set_type :person
  attributes :slug, :title, :body, :properties
end
