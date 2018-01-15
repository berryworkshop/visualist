class Event < ApplicationRecord
  validates :name, :body, :user, presence: true
  belongs_to :user
  has_many :subject_connections, as: :subject
  has_many :dobject_connections, as: :dobject
end
