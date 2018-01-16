class Organization < ApplicationRecord
  validates :name, :body, :user, presence: true
  belongs_to :user
end
