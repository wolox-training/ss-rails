class RentPolicy < ApplicationPolicy
  def index
  end

  def create
  end


  class Scope < Scope
    def resolve
      scope.all
    end
  end
end
