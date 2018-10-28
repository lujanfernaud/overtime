require 'rails_helper'

RSpec.describe User, type: :model do
  describe "creation" do
    it "can be created" do
      user = build(:user)

      expect(user).to be_valid
    end

    it "cannot be created without first_name and last_name" do
      user = build(:user, first_name: nil, last_name: nil)

      expect(user).to_not be_valid
    end
  end
end
