class ProjectPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end
  def new?
    true
  end
  def show?
    true
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

  def display_hint?
    true
  end

  def destroy?
    true
  end

  def download_zip?
    true
  end

end
