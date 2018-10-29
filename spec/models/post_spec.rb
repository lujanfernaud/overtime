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
  end
end
