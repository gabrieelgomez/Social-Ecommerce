module Api::V1::Statistics::Profiles
  class GeneralController < ProfilesController
    before_action :set_my_profile, only: %i[statistics]

    def statistics
      @profiles_graph = {
        statistics: {

          quantity_cotization_messages: {
            results: quantity_cotization_messages(params[:start_cotizations], params[:end_cotizations])
          }, # quantity_cotization_messages

          quantity_products_wishes: {
            results: quantity_products_wishes(params[:start_wishes], params[:end_wishes])
          }, # quantity_products_wishes

          quantity_products_offers: {
            results: quantity_products_offers(params[:start_offers], params[:end_offers])
          }, # quantity_products_offers

          quantity_users_rates: {
            results: quantity_users_rates(params[:start_rates], params[:end_rates])
          }, # quantity_users_rates

          quantity_conversations: {
            results: quantity_conversations(params[:start_conversations], params[:end_conversations])
          }, # quantity_conversations

          quantity_followers: {
            results: quantity_followers(params[:start_followers], params[:end_followers])
          },

        } # statistics
      } # @profiles_graph
      render json: @profiles_graph, status: 200
    end

  end
end
