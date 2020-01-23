class Recipe < ApplicationRecord
    has_many :recipe_diets
    has_many :diets, through: :recipe_diets
end
