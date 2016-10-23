class Category < ApplicationRecord
  validates :name, presence: true 

  has_many :categoryrecipes
  has_many :recipes, through: :categoryrecipes
end
