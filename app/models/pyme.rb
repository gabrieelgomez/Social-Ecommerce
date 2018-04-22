# Pyme model
class Pyme < Profile
  # Relations
  belongs_to :user
  has_many :products, as: :productable
  has_and_belongs_to_many :categories

  #Helper para permitir que el modelo pueda ser seguido por otros modelos
  acts_as_followable

  def self.mines
  	where(type_profile: 'pyme')
  end

  def self.by_owner(current_user)
  	where('type_profile = ? and user_id = ?', 'pyme', current_user)
  end
end
