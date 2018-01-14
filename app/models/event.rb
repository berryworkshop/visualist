class Event < ApplicationRecord
  validates :name, :body, presence: true
  # has_many :users
end
