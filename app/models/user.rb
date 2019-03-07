class User < ApplicationRecord
  validates :user_name, presence: true
  validates :email, presence: true, uniqueness:true, length: { maximum: 30 }
  validates :password, presence: true, length: { minimum: 6 }

  before_save { email.downcase! }
  has_secure_password
end
