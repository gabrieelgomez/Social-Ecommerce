# Pyme model
class Pyme < Profile
  resourcify
  # Neste relations
  # acts_as_commentable
  # Helper para permitir que el modelo pueda ser seguido por otros modelos
  acts_as_followable
  acts_as_paranoid

  # Relations
  belongs_to :user
  has_many :products, as: :productable, class_name: 'Product'
  has_many :custom_fields, as: :customizable
  has_many :options, as: :optionable
  has_and_belongs_to_many :categories
  has_many :messages, as: :messageable
  has_many :conversations, as: :senderable
  has_many :membership_conversations, as: :memberable

end
