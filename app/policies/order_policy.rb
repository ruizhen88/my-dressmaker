class OrderPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.dressmaker
        scope.where(dressmaker: user)
      else
        scope.where(user: user)
      end
    end
  end

  def index?
    true
  end

  def show?
    record.user == user || record.dressmaker == user
  end

  def create?
    true
  end
end
