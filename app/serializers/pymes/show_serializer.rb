class Pymes::ShowSerializer < ActiveModel::Serializer
  attributes :id, :title
  has_many :products

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
