class EventSerializer < ActiveModel::Serializer
  attributes :id, :name, :body, :created_at, :updated_at

  # model association
  # has_many :items
end
