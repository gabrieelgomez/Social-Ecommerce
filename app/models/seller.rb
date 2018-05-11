class Seller < Profile
  #Neste relations
  acts_as_commentable
  #Helper para permitir que el modelo pueda ser seguido por otros modelos
  acts_as_followable
  acts_as_paranoid

  # Relations
  belongs_to :user
  has_many :products, as: :productable
  has_many :custom_fields, as: :customizable
  has_and_belongs_to_many :categories

  def self.by_owner(current_user)
  	where('type_profile = ? and user_id = ?', 'seller', current_user)
  end

  def root_comments_profile
    Comment.where(commentable_id:self.id, commentable_type: self.type_profile.capitalize, parent_id: nil)
  end

end
