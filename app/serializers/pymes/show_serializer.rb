class Pymes::ShowSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :products, default: false
  has_many :posts, default: false
  belongs_to :user, default: false

  def attributes(args)
    data = super
    fields = scope[:fields]
    if fields
      replace = {}
      fields.split(',').map(&:to_sym).map do |field|
        replace[field] = object[field]
      end
      return replace
    else
      return data
    end
  end
end
