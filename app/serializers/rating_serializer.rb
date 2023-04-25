class RatingSerializer < ActiveModel::Serializer
  attributes :id, :rating_for_user, :value, :user_id
end
