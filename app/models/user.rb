# == Schema Information
#
# Table name: users
#
#  id                     :bigint(8)        not null, primary key
#  email                  :string           default(""), not null
#  encrypted_password     :string           default(""), not null
#  reset_password_token   :string
#  reset_password_sent_at :datetime
#  remember_created_at    :datetime
#  first_name             :string
#  last_name              :string
#  type                   :string
#  created_at             :datetime         not null
#  updated_at             :datetime         not null
#

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :posts

  validates_presence_of :first_name, :last_name, :phone

  def admin?
    type == "AdminUser"
  end

  def guest?
    type == "Guest"
  end

  def author?(post)
    post.user == self
  end

  def authorized_to_edit?(post)
    return true if admin?

    author?(post) && !post.approved?
  end

  def full_name_with_comma
    "#{last_name.capitalize}, #{first_name.capitalize}"
  end
end
