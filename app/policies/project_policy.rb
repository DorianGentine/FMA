class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def new?
    true
  end
  def show?
    record.users.include?(user)
  end
  def create?
    true
    # record.users.include?(user)
  end
  def update?
    true
    # record.users.include?(user)
  end

  def next_setp?
    true
  end
  def update_calendly?
    true
  end
  def display_hint?
    true
  end

  def destroy?
    true
  end

end
