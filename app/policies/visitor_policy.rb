class VisitorPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def update_formulary?
    true
  end
  def analyze?
    true
  end
end
