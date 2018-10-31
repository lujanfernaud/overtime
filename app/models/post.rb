# == Schema Information
#
# Table name: posts
#
#  id         :bigint(8)        not null, primary key
#  date       :date
#  rationale  :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :bigint(8)
#  status     :integer          default("submitted")
#

class Post < ApplicationRecord
  enum status: { submitted: 0, approved: 1, rejected: 2 }

  belongs_to :user

  validates_presence_of :date, :rationale
end
