class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
    # user == curent_user
    # current user should be able to see any message belongs to the order, whether the sender is a dresssmaker or a customer
    scope
      .joins(:order)
      .where(orders: { user_id: user.id })
      .or(
        scope.joins(:order).where(orders: { dressmaker_id: user.id })
      )
    end
  end

  def index?
    record.present?
  end

  def show?
  end

  def create?
    true
  end
end
