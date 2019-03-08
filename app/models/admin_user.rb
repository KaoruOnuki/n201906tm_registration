class AdminUser < ApplicationRecord
  validates :admin_name, presence: true
  validates :admin_email, presence: true, uniqueness:true, length: { maximum: 30 }
  validates :password, presence: true, length: { minimum: 6 }

  before_save { admin_email.downcase! }
  has_secure_password
end
