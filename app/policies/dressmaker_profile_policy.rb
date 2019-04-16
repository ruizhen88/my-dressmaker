class DressmakerProfilePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def edit?
    record.user == user
  end

  def create?
    record.user == user
  end

  def update?
    record.user == user
  end
end
