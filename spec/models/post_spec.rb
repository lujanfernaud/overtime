require 'rails_helper'

RSpec.describe Post, type: :model do
  describe "creation" do
    it "can be created" do
      post = build(:post)

      expect(post).to be_valid
    end

    it "cannot be created without date" do
      post = build(:post, date: nil)

      expect(post).not_to be_valid
    end

    it "cannot be created without rationale" do
      post = build(:post, rationale: nil)

      expect(post).not_to be_valid
    end
  end
end
