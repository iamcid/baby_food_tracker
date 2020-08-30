class Review < ApplicationRecord
  belongs_to :user
  belongs_to :baby_food

  validates :stars, numericality: true
  validates :title, presence: true
end
