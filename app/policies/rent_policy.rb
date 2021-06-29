class RentPolicy < ApplicationPolicy
  def index?
    record
  end

  def create?
    record.user_id == user.id
  end

  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end
end
  