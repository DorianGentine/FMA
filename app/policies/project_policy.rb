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
    true
    # record.users.include?(user)
  end

  def next_setp?
    true
  end
end
