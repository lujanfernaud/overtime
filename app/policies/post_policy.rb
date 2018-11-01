class PostPolicy < ApplicationPolicy
  def update?
    user.authorized_to_edit?(record)
  end
end
