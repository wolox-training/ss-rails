module Api
  module V1
    class RentsController < ApiController
      def index
        rents = current_user.rents.all
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
