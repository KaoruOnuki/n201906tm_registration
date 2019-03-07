class Trademark < ApplicationRecord
  validates :tm_name, presence: true
  validates :description, presence: true
end
