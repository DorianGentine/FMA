class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def show?
    if user.advisor && user.clients.include?(record)
      return true
    elsif user.admin
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
end
