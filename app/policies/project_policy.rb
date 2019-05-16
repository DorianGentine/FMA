class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end

  def show?
    record.users.include?(user)
  end
  def create?
    record.users.include?(user)
  end
  def update?
    record.users.include?(user)
  end
end
