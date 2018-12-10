module Api::V1::Wallets::Transactions
  class StatisticsController < TransactionsController
    before_action :set_wallet, only: %i[daily monthly]
    before_action :search_dates, only: %i[daily monthly]

    def daily
      render json: @statistics, status: 200
    end

    def monthly
      render json: @statistics, status: 200
    end


    private

    def search_dates
      initial = Date.parse(params[:initial])
      last    = Date.parse(params[:last])
      @statistics = []
      initial.step(last,1).each_with_index{|date,i|
        @statistics.push(
          date: date,
          result: @wallet.transactions.date_between(initial, (date+1).strftime('%Y-%m-%d')).count
        )
      }
    end

  end
end
