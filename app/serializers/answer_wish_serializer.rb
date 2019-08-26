class AnswerWishSerializer < ActiveModel::Serializer
  # attributes :id, :profile, :sended_wish
  attributes *AnswerWish.column_names

end
