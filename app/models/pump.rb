class Pump < ApplicationRecord
    belongs_to :workout
    belongs_to :user
    belongs_to :diet
end
