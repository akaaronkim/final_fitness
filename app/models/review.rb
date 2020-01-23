class Review < ApplicationRecord
    belongs_to :workout_type
    belongs_to :user
end
