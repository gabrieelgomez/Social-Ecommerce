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

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end
end
