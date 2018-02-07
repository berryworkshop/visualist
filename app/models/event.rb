class Event < ApplicationRecord
  validates :name, :body, :user, presence: true
  belongs_to :user
end
