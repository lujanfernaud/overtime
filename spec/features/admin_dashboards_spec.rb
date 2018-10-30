require 'rails_helper'

RSpec.feature "AdminDashboards", type: :feature do
  it "does not allow users to access without being signed in" do
    visit admin_root_path

    expect(current_path).to eq(new_user_session_path)
  end

  it "cannot be reached by a non admin user" do
    user = build(:user)

    login_as(user)

    visit admin_root_path

    expect(current_path).to eq(new_user_session_path)
  end

  it "can be reached by an admin user" do
    user = build(:user, :admin)

    login_as(user)

    visit admin_root_path

    expect(current_path).to eq(admin_root_path)
  end
end
