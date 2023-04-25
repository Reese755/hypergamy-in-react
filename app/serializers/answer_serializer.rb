class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :user_id, :question_id, :text
end
