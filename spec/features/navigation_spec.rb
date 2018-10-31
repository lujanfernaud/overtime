require 'rails_helper'

RSpec.feature "Navigations", type: :feature do
  scenario "when a user is not logged in" do
    visit root_path

    expect(page).not_to have_css(".custom-nav")
  end

  scenario "when a user is logged in" do
    user = build_stubbed(:user)

    login_as(user)

    visit root_path

    expect(page).to have_css(".custom-nav")
  end
end
