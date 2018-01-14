class User < ApplicationRecord
  has_secure_password # required by knock
  validates :name, :email, :password_digest, presence: true
  # has_many :events
end
