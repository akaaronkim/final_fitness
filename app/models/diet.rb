class Diet < ApplicationRecord
    belongs_to :user
    has_many :reviews
    has_many :pumps
  
    def sorted_reviews
      self.reviews.sort_by do |review|
        review.created_at
      end.reverse
    end
  
    def self.search(search)
      if search #if the user searched
        @reviews = self.where(content_type: search)
        if @reviews.length >= 1 #if at least one review returned
          @reviews
        else
          @reviews = nil
        end
      else
        @reviews = Review.all #if no search value return all 
      end
    end
end
