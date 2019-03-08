class Trademark < ApplicationRecord
  validates :tm_name, presence: true
  validates :description, presence: true

  belongs_to :user
  has_one :state, dependent: :destroy
end
