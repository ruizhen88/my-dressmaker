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
    true
  end

  def update?
    true
  end
end
