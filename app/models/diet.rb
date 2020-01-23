class Diet < ApplicationRecord
    has_many :recipe_diets
    has_many :recipes, through: :recipe_diets
end
