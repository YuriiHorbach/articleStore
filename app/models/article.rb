class Article < ApplicationRecord
  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 20 }

  scope :free, -> {where(premium: false)}
end
