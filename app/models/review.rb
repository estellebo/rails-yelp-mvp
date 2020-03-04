class Review < ApplicationRecord
  belongs_to :restaurant

  validates :rating, inclusion: { in: (0..5) }
  validates :rating, numericality: { only_integer: true }
  validates :restaurant, presence: true
  validates :content, presence: true
end
