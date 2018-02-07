class Organization < Agent
  validates :name, :body, :user, presence: true
  belongs_to :user
end
