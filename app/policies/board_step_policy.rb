class BoardStepPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    user.owner?
  end

  def update?
    create?
  end

  def permitted_attributes_for_create
    [:title, :position, :task_board_id]
  end

  def permitted_attributes_for_update
    [:title, :position]
  end
end
