class Person < Agent
  validates :name, :body, :user, presence: true
  belongs_to :user
end
