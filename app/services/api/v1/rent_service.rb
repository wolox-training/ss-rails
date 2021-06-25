module Api
  module V1
    class RentService
      def initialize(rent_params, user)
        @rent_params = rent_params
        @user = user
      end

      def new_rent
        rent = Rent.new(@rent_params)
        rent.user = @user
        rent
      end
    end
  end
end
