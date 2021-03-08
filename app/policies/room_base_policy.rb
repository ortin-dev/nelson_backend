class RoomBasePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    # user.owner?
    true
  end

  def permitted_attributes_for_create
    [:title, :room_type]
  end

  def permitted_attributes_for_update
    [:title]
  end
end
