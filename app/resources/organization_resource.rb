class OrganizationResource < JSONAPI::Resource
  attributes :name, :body
  has_one :user
end
