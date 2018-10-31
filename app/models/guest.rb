# Guest user using the Null Object pattern.
class Guest
  def email
    "guest@test.test"
  end

  def first_name
    "Guest"
  end

  def last_name
    "User"
  end

  def type
    "Guest"
  end

  def admin?
    false
  end

  def guest?
    true
  end

  def author?(_post)
    false
  end
end
