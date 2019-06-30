class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.advisor || user.admin
        scope.all.where(client: true)
      end
    end
  end

  def intercom?
    true
  end
  def advisors?
    if user.admin
      true
    end
  end

  def show?
    if user.advisor || user.admin
      return true
    else
      return true if record == user
    end
  end

  def update?
    user == record
  end

  def conseiller?
    true
  end
  def calendly?
    true
  end
  def create?
    true
  end

  def restart_compteur?
    user.advisor
  end
end
