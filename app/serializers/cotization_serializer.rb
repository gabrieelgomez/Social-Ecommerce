class CotizationSerializer < ActiveModel::Serializer
  attributes :id, :price, :currency, :stage, :status, :created_at, :updated_at, :details, :client, :cotizable, :products#, :items

  # belongs_to :cotizable, polymorphic: true
  # belongs_to :user

  def client
    object.client.clientable
  end

  def products
    object.items.collect{|item| item.product}
  end

end
