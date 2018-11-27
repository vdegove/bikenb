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

  # def my_bike?
  #   true
  #   # record.user == user
  #   # record[1].user_id == user.id
  #   # record.id == user.id
  # end

end
