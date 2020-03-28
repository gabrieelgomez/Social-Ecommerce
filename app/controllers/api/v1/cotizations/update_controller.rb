module Api::V1::Cotizations
  # Update controller
  class UpdateController < CotizationsController

    def update
      if @cotization.update(cotization_params)

        @items_params = params[:cotization][:items]

        unless @items_params.nil? || @items_params.try(:empty?)
          @items_ids_params        = @items_params.map{|item| item[:item_id]}
          @items    = @cotization.items.where(id: @items_ids_params)
          destroy_items

          @items_params.each do |item|
            object  = @cotization.items.find(item[:item_id])
            product = Product.find(item[:product_id])
            object.option_values = JSON.parse(item[:option_values].to_json)
            object.quantity      = item[:quantity]
            object.save
          end
        end

        render json: @cotization, status: 200
      else
        render json: @cotization.errors,
               status: 422
      end
    end

    private

    def destroy_items
      items_ids_cotization    = @items.pluck(:id)
      items_ids_destroy       = items_ids_cotization - @items_ids_params
      items_by_destroy        = @cotization.items.where(id: items_ids_destroy).destroy_all
    end

  end
end
