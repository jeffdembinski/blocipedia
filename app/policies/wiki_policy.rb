class WikiPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      wikis = []
      if user.role == 'admin'
        wikis = scope.all
      elsif user.role == 'premium'
        all_wikis = scope.all
        all_wikis.each do |wiki|
          if wiki.private == false || wiki.user == user
            wikis << wiki
          end
        end
      else
        all_wikis = scope.all
        all_wikis.each do |wiki|
          if wiki.private == false
            wikis << wiki
          end
        end
      end
      wikis
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
