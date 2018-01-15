class UserResource < JSONAPI::Resource
  attributes :name, :email, :password
  has_many :events
  has_many :pages
end
