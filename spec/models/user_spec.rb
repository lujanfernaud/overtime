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

require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    it "can be created" do
      user = build_stubbed(:user)

      expect(user).to be_valid
    end
  end

  describe "validations" do
    it "cannot be created without first_name and last_name" do
      user = build_stubbed(:user, first_name: nil, last_name: nil)

      expect(user).to_not be_valid
    end

    it "cannot be created without a phone" do
      user = build_stubbed(:user, phone: nil)

      expect(user).to_not be_valid
    end

    it "requires the phone to only contain integers" do
      user = build_stubbed(:user, phone: "abcdefghjo")

      expect(user).not_to be_valid
    end

    it "requires the phone to only have 10 characters" do
      user = build_stubbed(:user, phone: 12345678901)

      expect(user).not_to be_valid
    end
  end

  describe "#admin?" do
    it "returns 'true' for an admin" do
      user = build_stubbed(:user, :admin)

      expect(user.admin?).to be(true)
    end

    it "returns 'false' for a non admin" do
      user = build_stubbed(:user)

      expect(user.admin?).to be(false)
    end
  end

  describe "#author?" do
    it "returns 'true' for post author" do
      user = create(:user)
      post = create(:post, user: user)

      expect(user.author?(post)).to be(true)
    end

    it "returns 'false' for non post author" do
      user = create(:user)
      post = create(:post)

      expect(user.author?(post)).to be(false)
    end
  end

  describe "#full_name_with_comma" do
    it "shows full name with last name first and comma separator" do
      user = build_stubbed(:user, first_name: "Yao", last_name: "Dao")

      expect(user.full_name_with_comma).to eq("Dao, Yao")
    end

    it "shows full name capitalized" do
      user = build_stubbed(:user, first_name: "yao", last_name: "dao")

      expect(user.full_name_with_comma).to eq("Dao, Yao")
    end
  end

  describe "#authorized_to_edit?" do
    it "returns 'true' when the post has a status of 'submitted'" do
      user = create(:user)
      post = create(:post, user: user)

      expect(post.status).to eq("submitted")
      expect(user.authorized_to_edit?(post)).to be(true)
    end

    it "returns 'false' when the post doesn't have a status of 'submitted'" do
      user = create(:user)
      post = create(:post, user: user)

      post.approved!

      expect(post.status).to eq("approved")
      expect(user.authorized_to_edit?(post)).to be(false)
    end

    it "returns 'true' when the user is an admin" do
      admin = create(:user, :admin)
      user  = create(:user)
      post  = create(:post, user: user)

      post.approved!

      expect(post.status).to eq("approved")
      expect(admin.authorized_to_edit?(post)).to be(true)
    end
  end
end
