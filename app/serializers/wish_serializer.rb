class WishSerializer < ActiveModel::Serializer
  attributes :id, :name, :budget, :description, :user, :owner, :response, :sent,
             :wisheable, :priority, :private, :created_time, :deleted_at, :updated_at, :sended_wish

  def wisheable
    wisheable = object.wisheable
    if wisheable.is_a?(Product)
      object.wisheable.as_json.merge({
        productable_url: wisheable.productable.url,
        url_get: wisheable.productable.url + "/products/#{wisheable.id}"
      })
    elsif wisheable.is_a?(Profile)
      object.wisheable.as_json
    end
    # /v1/:type_profile/:profile_id/products/:id
  end

  def created_time
    object.created_at.strftime("%F / %T")
  end

  def sended_wish
    sended_wish = object.sended_wish
    sended_wish.as_json(only: %i[id user_id profile_id wish_id], methods: %i[answer_wish])
  end

  def owner
    wisheable = object.wisheable
    wisheable.productable
  end

end
