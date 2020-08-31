class BabyFood < ApplicationRecord
  belongs_to :category
  belongs_to :user
  has_many :reviews
  has_many :users, through: :reviews

  accepts_nested_attributes_for :category

  validates :flavor, presence: true
  validate :no_duplicates

  # def category_attributes(attributes)
  #   self.category = Category.find_or_create_by(attribute) if !attributes['name'].empty?
  #   self.category
  # end

  def no_duplicates
    if BabyFood.find_by(flavor: flavor, category_id: category_id)
    errors.add(:flavor, 'has already been added for that category')
    end
  end
end
