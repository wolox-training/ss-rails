module Api
  module V1
    class RentsController < ApiController
      def index
        rents = policy_scope Rent
        authorize rents
        render_paginated rents, each_serializer: RentSerializer
      end

      def create
        rent = assign_rent
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

      def assign_rent
        rent ||= Rent.new(rent_params)
        rent.user = current_user
        rent
      end

      def rent_params
        params.require(:rent).permit(:book_id, :start_of_rent, :end_of_rent)
      end
    end
  end
end
