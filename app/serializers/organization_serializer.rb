class OrganizationSerializer < NodeSerializer
  set_type :organization
  attributes :slug, :title, :body, :properties
end
