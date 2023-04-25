class CategorySerializer < ActiveModel::Serializer
  attributes :id, :user_id, :rating_id, :age_range, :gender, :location
end
