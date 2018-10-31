require 'rails_helper'

RSpec.feature "ApprovalWorkflows", type: :feature do
  before do
    admin = build(:user, :admin)
    login_as(admin)
  end

  describe "edit" do
    it "has a status that can be edited on the form" do
      admin = create(:user, :admin)
      post  = create(:post)

      login_as(admin)

      visit edit_post_path(post)

      choose "post_status_approved"

      click_on "Save"

      within ".post_#{post.id}" do
        expect(page).to have_content("Approved")
      end
    end
  end
end
