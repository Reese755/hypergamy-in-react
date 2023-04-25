class Rating < ApplicationRecord
    
   
    has_many :categories, dependent: :destroy
    belongs_to :user
    
    
    def average_rating_value
        self.average(:number_of_ratings)
    end

    def average_ratings_of_others_value
        self.average(:average_ratings_of_others)
    end


end
