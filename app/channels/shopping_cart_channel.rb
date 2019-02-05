class ShoppingCartChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    stream_from "shopping-carts-#{current_user.id}"
  end

  def push_items(data)
    json = data['data']
    current_user.shopping_cart.update(data_json: json)
    ActionCable.server.broadcast(
      "shopping-carts-#{current_user.id}",
      'savedData'
    )
  end

  def pull_items
    data = current_user.shopping_cart.data_json
    ActionCable.server.broadcast(
      "shopping-carts-#{current_user.id}",
      data: data
    )
  end

  def cotizations_items(data)
    logger.debug data
    logger.info  data

    count = data['data'].count

    ActionCable.server.broadcast(
      "shopping-carts-#{current_user.id}",
      "Loading data, total cotizations are #{count}"
    )

    count.times do |x|
      object = data['data'][x]

      profile       = Profile.find(object['profile_id'])
      product       = Product.find(object['product_id'])
      shopping_cart = current_user.shopping_cart
      conversation  = Conversation.get(profile, current_user, 'cotization')
      client        = Client.find_by!(clientable: current_user)

      ActionCable.server.broadcast(
        "shopping-carts-#{current_user.id}",
        "Processing cotization ##{x+1}, profile_id: #{profile.id}, product_id:#{product.id}"
      )

      custom_field_ids = object['items']['custom_field_ids'].select do |cf_id|
        product.custom_fields.map(&:id).include? cf_id
      end

      productable_op_ids = product.productable.options.map(&:id)
      option_ids = object['items']['option_ids'].select do |op_id|
        productable_op_ids.include? op_id
      end

      option_values = object['items']['option_values'].select do |key, val|
        option_ids.include?(key.to_i) &&
          Option.find(key.to_i).values.map(&:downcase).include?(val.downcase)
      end

      item = shopping_cart.items.new(product_id: object['product_id'],
                                       custom_field_ids: custom_field_ids,
                                       option_ids: option_ids,
                                       option_values: option_values,
                                       quantity: object['items']['quantity'])

     if item.save
       ActionCable.server.broadcast(
         "shopping-carts-#{current_user.id}",
         data: shopping_cart
       )
     else
       ActionCable.server.broadcast(
         "shopping-carts-#{current_user.id}",
         data: item.errors
       )
     end

     msg = conversation.messages.new(
       body: Api::V1::ShoppingCarts::QuotingService.set_message(current_user, shopping_cart, item),
       messageable: current_user
     )

     Api::V1::ShoppingCarts::QuotingService.handle_quote(profile, client, msg, [item.id])

     ActionCable.server.broadcast(
       "shopping-carts-#{current_user.id}",
       "Finished cotization ##{count}, profile_id: #{profile.id}, product_id:#{product.id}"
     )

    end

  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end
end
