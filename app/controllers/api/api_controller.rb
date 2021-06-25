module Api
  class ApiController < ApplicationController
    before_action :authenticate_user!
    include Wor::Paginate
  end
end
