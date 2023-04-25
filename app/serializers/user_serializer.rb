class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :email, :password_digest, :profile_picture, :name, :location, :age, :height, :weight, :gender
end
