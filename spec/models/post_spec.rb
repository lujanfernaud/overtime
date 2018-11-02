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

require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "creation" do
    it "can be created" do
      post = build_stubbed(:post)

      expect(post).to be_valid
    end

    it "cannot be created without date" do
      post = build_stubbed(:post, date: nil)

      expect(post).not_to be_valid
    end

    it "cannot be created without rationale" do
      post = build_stubbed(:post, rationale: nil)

      expect(post).not_to be_valid
    end

    it "cannot be created without overtime hours" do
      post = build_stubbed(:post, overtime_hours: nil)

      expect(post).not_to be_valid
    end

    it "cannot be created without overtime hours being bigger than 0.0" do
      post = build_stubbed(:post, overtime_hours: 0.0)

      expect(post).not_to be_valid
    end
  end

  describe "#status" do
    it "has a default value of 'submitted'" do
      post = build_stubbed(:post)

      expect(post.status).to eq("submitted")
    end

    it "can be set to 'approved'" do
      post = create(:post)
      post.approved!

      expect(post.status).to eq("approved")
    end

    it "can be set to 'rejected'" do
      post = create(:post)
      post.rejected!

      expect(post.status).to eq("rejected")
    end
  end
end
