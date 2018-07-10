class WikiPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(private: false)
    end
  end

  def new?
    user.present?
  end

  def create?
    user.present?
  end

  def edit?
    user.present?
  end

  def show?
    user.present?
  end

  def destroy?
    user_is_owner? || user.admin?
  end

  private

  def user_is_owner?
    user == @record.user
  end

end
