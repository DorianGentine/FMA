class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      if user.advisor
        user.his_clients
      end
    end
  end

  def show?
    if user.advisor && user.his_clients.include?(record)
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
