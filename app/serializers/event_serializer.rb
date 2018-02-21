class EventSerializer < ActiveModel::Serializer
  attributes :name, :body, :properties
  belongs_to :user
end
