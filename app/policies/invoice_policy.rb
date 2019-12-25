class InvoicePolicy < ApplicationPolicy
  class Scope 
    def resolve
      scope.all
    end
  end

  def show?
    record.paid_for?
  end
end
