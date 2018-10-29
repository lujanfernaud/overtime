require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    it "can be created" do
      user = build_stubbed(:user)

      expect(user).to be_valid
    end

    it "cannot be created without first_name and last_name" do
      user = build_stubbed(:user, first_name: nil, last_name: nil)

      expect(user).to_not be_valid
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
end
