class RoomBasePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.owner?
        scope.all
      else
        scope.includes(:teamates).where(teamates: { user_id: user.id })
      end
    end
  end

  def create?
    user.owner?
  end

  def index?
    user.owner? || user.teammate?
  end

  def permitted_attributes_for_create
    [:title, :room_type]
  end

  def permitted_attributes_for_update
    [:title]
  end
end
