class Category < ApplicationRecord
    has_many :baby_foods

    validates :name, presence: true
end
