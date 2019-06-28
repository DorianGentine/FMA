class RessourcePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    if user.admin
      true
    else
      false
    end
  end

  def update?
    if user.admin
      true
    else
      false
    end
  end

  def destroy?
    if user.admin
      true
    else
      false
    end
  end
end
