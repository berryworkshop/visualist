class User < ApplicationRecord
  has_secure_password # required by knock
end
