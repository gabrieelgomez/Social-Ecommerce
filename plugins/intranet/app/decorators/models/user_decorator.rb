User.class_eval do
  # # Decorators Intranet
  has_and_belongs_to_many :cards, class_name: 'Intranet::Card'
  # has_one :intranet, class_name: 'Intranet::Intranet', dependent: :destroy
  # has_many :groups, through: :intranet, class_name: 'Intranet::Group', dependent: :destroy
  #
  # has_many :intranet
  # has_many :groups, through: :intranet

end
