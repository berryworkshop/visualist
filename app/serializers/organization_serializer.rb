class OrganizationSerializer < NodeSerializer
  set_type :organization
  attributes :slug, :title, :properties, :body, :created_at, :updated_at
end
