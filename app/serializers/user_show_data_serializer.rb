class UserShowDataSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :password_digest, :profile_picture, :name, :location, :age, :height, :weight, :gender, :number_of_ratings, :average_rating, :number_of_people_you_have_rated, :average_ratings_of_others, :gender

  has_many :categories
  has_many :ratings
  has_many :surveys
  has_many :answers
  has_many :questions
end
