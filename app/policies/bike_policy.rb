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
    true
  end

  def index?
    true
  end

  def update?
    record.user == user
  end

  def edit?
    update?
  end

end
