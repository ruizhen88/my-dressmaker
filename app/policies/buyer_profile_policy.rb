class BuyerProfilePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    user_is_buyer
  end

  def update?
    user_is_buyer
  end

  private

  def user_is_buyer
    record.user == user
  end
end
