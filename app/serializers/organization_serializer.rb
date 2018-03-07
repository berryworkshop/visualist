class OrganizationSerializer < NodeSerializer
  set_type :organization
  attributes :slug, :title, :body, :properties, :created_at, :updated_at
end
