class RentPolicy < ApplicationPolicy
  def index?
    byebug
    user[:current_user] == user[:user_params]
  end

  def create?
    record.user_id == user.id
  end

  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
