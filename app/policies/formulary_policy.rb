class FormularyPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope
    end
  end
  def create?
    true
  end
  def update?
    true
  end

  def sort?
    true
  end
end
