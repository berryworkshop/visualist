class UserSerializer
  include FastJsonapi::ObjectSerializer

  set_type :user
  attributes :name, :email, :created_at, :updated_at, :absolute_url
end
