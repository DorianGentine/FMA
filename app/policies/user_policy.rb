class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def show?
    record == user if user.client || user.advisor
    # TODO
    # true if user.admin
    # true if record.user_projects.where(user: user)
  end
  def create?
    true
  end
end
