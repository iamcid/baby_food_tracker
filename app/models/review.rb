class Review < ApplicationRecord
  belongs_to :user
  belongs_to :baby_food

  validates :stars, numericality: true
  validates :title, presence: true

  validates :baby_food, uniqueness: {scope: :user, message: "has already been reviewed by you."}
end
