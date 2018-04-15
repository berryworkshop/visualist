class User < ApplicationRecord
  validates :name, :email, presence: true
  validates :email, uniqueness: { case_sensitive: false }

  def absolute_url
    return self.user_path self.id
  end
end
