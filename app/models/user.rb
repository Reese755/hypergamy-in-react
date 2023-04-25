class User < ApplicationRecord
    
    has_many :categories, dependent: :destroy
    has_many :ratings
    has_many :surveys
    has_many :answers, dependent: :destroy
    has_many :questions, through: :answers
    


    validates :username, presence: true, uniqueness: true
    validates :email, presence: true, uniqueness: true
    validates :password, presence: true
   

    has_secure_password

    def chart
        data = User.group(:age).count
        @chart_data = data.map { |group, count| [group, count] }
      end

      def number_of_ratings
        Rating.where(rating_for_user: self.id).length
      end

      def average_rating
          return Rating.where(rating_for_user: self.id).average(:value) unless Rating.where(rating_for_user: self.id).length == 0
          return 0 
        
      end

      def number_of_people_you_have_rated
        self.ratings.length
      end
      
      def average_ratings_of_others
        self.ratings.average(:value)
      end
end
