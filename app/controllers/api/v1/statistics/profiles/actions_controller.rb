module Api::V1::Statistics::Profiles
  class ActionsController < ProfilesController
    before_action :set_my_profile, only: %i[statistics]

    def statistics
      @profiles_graph = {
        statistics: {

          quantity_cotization_messages: {
            results: quantity_cotization_messages
          }, # quantity_cotization_messages

          quantity_products_wishes: {
            results: quantity_products_wishes
          }, # quantity_products_wishes

          quantity_products_offers: {
            results: quantity_products_offers
          }, # quantity_products_offers

          quantity_users_rates: {
            results: quantity_users_rates
          }, # quantity_users_rates

          quantity_conversations: {
            results: quantity_conversations
          }, # quantity_conversations

          quantity_followers: {
            results: quantity_followers
          },

        } # statistics
      } # @profiles_graph
      render json: @profiles_graph, status: 200
    end

    private

    def quantity_cotization_messages
      @profile.cotizations.date_between(params[:start_cotizations], params[:end_cotizations]).count
    end

    def quantity_products_wishes
      current_v1_user.wishes.products.date_between(params[:start_wishes], params[:end_wishes]).count
    end

    def quantity_products_offers
      Offer.where(id: @profile.product_ids).date_between(params[:start_offers], params[:end_offers]).count
    end

    def quantity_users_rates
      @profile.rates.date_between(params[:start_rates], params[:end_rates]).count
    end

    def quantity_conversations
      @profile.conversations.date_between(params[:start_conversations], params[:end_conversations]).count
    end

    def quantity_followers
      @profile.followers_by_type_profile('User', model_name).ransack(created_at_gteq: params[:start_followers], created_at_lteq: params[:end_followers]).result.count
    end

  end
end
