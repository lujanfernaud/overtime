require 'rails_helper'

RSpec.describe Guest, type: :model do
  before do
    @guest = Guest.new
  end

  describe "#email" do
    it "returns email" do
      expect(@guest.email).to eq("guest@test.test")
    end
  end

  describe "#first_name" do
    it "returns first_name" do
      expect(@guest.first_name).to eq("Guest")
    end
  end

  describe "#last_name" do
    it "returns last_name" do
      expect(@guest.last_name).to eq("User")
    end
  end

  describe "#type" do
    it "returns type" do
      expect(@guest.type).to eq("Guest")
    end
  end

  describe "#admin?" do
    it "returns admin?" do
      expect(@guest.admin?).to be(false)
    end
  end

  describe "#author?" do
    it "returns author?" do
      post = build_stubbed(:post)

      expect(@guest.author?(post)).to be(false)
    end
  end
end
