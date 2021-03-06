class ReservationPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def validate?
    record.bike.user == user
  end

  def decline?
    record.bike.user == user
  end
end
