class PostPolicy < ApplicationPolicy
  def update?
    user.admin? || user.author?(record)
  end
end
