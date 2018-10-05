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

    def quantity_cotization_messages(initial, date) # case cotizations
      @profile.cotizations.date_between(initial, date.strftime('%Y-%m-%d')).count
    end

    def quantity_products_wishes(initial, date) # case wishes
      current_v1_user.wishes.products.date_between(initial, date.strftime('%Y-%m-%d')).count
    end

    def quantity_products_offers(initial, date) # case offers
      Offer.where(id: @profile.product_ids).date_between(initial, date.strftime('%Y-%m-%d')).count
    end

    def quantity_users_rates(initial, date) # case rates
      @profile.rates.date_between(initial, date.strftime('%Y-%m-%d')).count
    end

    def quantity_conversations(initial, date) # case conversations
      @profile.conversations.date_between(initial, date.strftime('%Y-%m-%d')).count
    end

    def quantity_followers(initial, date) # case followers
      @profile.followers_by_type_profile('User', model_name).ransack(created_at_gteq: params[:start_followers], created_at_lteq: params[:end_followers]).result.count
    end

    def switch_module(date)
      case params[:module]
        when 'cotizations'
          quantity_cotization_messages(params[:initial], date+1)
        when 'wishes'
          quantity_products_wishes(params[:initial], date+1)
        when 'offers'
          quantity_products_offers(params[:initial], date+1)
        when 'rates'
          quantity_users_rates(params[:initial], date+1)
        when 'conversations'
          quantity_conversations(params[:initial], date+1)
      end
    end

  end
end
