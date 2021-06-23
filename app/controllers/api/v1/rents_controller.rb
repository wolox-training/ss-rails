module Api
  module V1
    class RentsController < ApplicationController
      before_action :authenticate_user!

      def index
      end

      def create
      end

      private

      def rent_params
        params.require(:rent).permit(:user_id, :book_id, :start_of_rent, :end_of_rent)
      end
    end
  end
end
