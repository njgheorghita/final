class User < ApplicationRecord
  validates :email, :password, presence: true
  validates :email, uniqueness: true
  has_secure_password
  has_many :links
end
