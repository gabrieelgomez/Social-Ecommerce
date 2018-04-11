# Independently model
class Independent < Profile
  # Relations
  belongs_to :user
  has_many :products, as: :productable

  #Helper para permitir que el modelo pueda ser seguido por otros modelos
  acts_as_followable

  def self.mines
  	where(type_profile: 'independent')
  end
end
