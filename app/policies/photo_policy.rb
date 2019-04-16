class PhotoPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.dressmaker
        scope.where(dressmaker: user)
      else
        scope.where(user: user)
      end
    end
  end

  def create?
    record.dressmaker_profile == user.dressmaker_profile
  end

  def destroy?
    record.dressmaker_profile == user.dressmaker_profile
  end
end
