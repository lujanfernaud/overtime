require 'rails_helper'

RSpec.feature "ApprovalWorkflows", type: :feature do
  describe "edit" do
    it "has a status that can be edited on the form" do
      user = create(:user)
      post = create(:post, user: user)

      login_as(user)

      visit edit_post_path(post)

      choose "post_status_approved"

      click_on "Save"

      within ".post_#{post.id}" do
        expect(page).to have_content("Approved")
      end
    end

    it "can be edited by an admin" do
      admin = create(:user, :admin)
      post  = create(:post)

      login_as(admin)

      visit edit_post_path(post)

      expect(current_path).to eq(edit_post_path(post))
      expect(page).to have_css(".status-selector")
    end

    it "cannot be edited by a non admin" do
      user = create(:user)
      post = create(:post)

      login_as(user)

      visit edit_post_path(post)

      expect(current_path).to_not eq(edit_post_path(post))
      expect(page).to_not have_css(".status-selector")
    end
  end
end
