class BikePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  def create?
    return true
  end

  def index
    @bikes = policy_scope(bike)
  end
end
