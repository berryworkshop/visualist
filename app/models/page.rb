class Page < ApplicationRecord
  validates :name, :body, :user, presence: true
  belongs_to :user
end
