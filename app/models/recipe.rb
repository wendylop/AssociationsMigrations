class Recipe < ApplicationRecord
  validates :name, presence: true

  has_many :categoryrecipes
  has_many :categories, through: :categoryrecipes
end
