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
    if user.admin
      return true
    elsif user.advisor
      if record == user
        return true
      elsif record.is_a_client
        record.project.is_his_advisor == user
      else
        return false
      end
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
