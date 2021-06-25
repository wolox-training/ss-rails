module Api
  module V1
    class RentsController < ApiController
      def index
        rents = current_user.rents.all
        render_paginated rents, each_serializer: RentSerializer
      end

      def create
        rent = Api::V1::RentService.new(rent_params, current_user).new_rent
        if rent.save
          render json: rent, status: :created
        else
          render json: { errors: [{ code: '400', message: rent.errors }] }, status: :bad_request
        end
      end

      def active
        render_paginated Rent.active_rentals, each_serializer: RentSerializer
      end

      def book_rankings
        render_paginated Book.ranking, each_serializer: RankingSerializer
      end

      private

      def rent_params
        params.require(:rent).permit(:book_id, :start_of_rent, :end_of_rent)
      end
    end
  end
end
