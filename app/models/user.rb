class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts

  validates_presence_of :first_name, :last_name

  def admin?
    type == "AdminUser"
  end

  def full_name_with_comma
    "#{last_name.capitalize}, #{first_name.capitalize}"
  end
end
