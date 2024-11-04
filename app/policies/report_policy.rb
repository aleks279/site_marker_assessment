class ReportPolicy < ApplicationPolicy
  def index?
    user.has_full_access? || user.can_edit? || user.can_view?
  end

  def show?
    user.has_full_access? || user.can_edit? || user.can_view?
  end

  def create?
    user.has_full_access?
  end

  def update?
    user.has_full_access? || user.can_edit?
  end

  def destroy?
    create?
  end
end
