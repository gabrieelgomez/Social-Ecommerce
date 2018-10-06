module Api::V1::Statistics::Profiles
  class DailyController < ProfilesController
    before_action :set_my_profile, only: %i[statistics]

    def statistics
      initial = Date.parse(params[:initial])
      last    = Date.parse(params[:last])
      @statistics = []
      initial.step(last,1).each_with_index{|date,i|
        result = switch_module(date)
        @statistics.push(
          date: date,
          result: result
        )
      }

      render json: @statistics, status: 200
    end

    private

    def switch_module(date)
      case params[:module]
        when 'cotizations'
          quantity_cotization_messages(params[:initial], (date+1).strftime('%Y-%m-%d'))
        when 'wishes'
          quantity_products_wishes(params[:initial], (date+1).strftime('%Y-%m-%d'))
        when 'offers'
          quantity_products_offers(params[:initial], (date+1).strftime('%Y-%m-%d'))
        when 'rates'
          quantity_users_rates(params[:initial], (date+1).strftime('%Y-%m-%d'))
        when 'conversations'
          quantity_conversations(params[:initial], (date+1).strftime('%Y-%m-%d'))
      end
    end

  end
end
