require 'rails_helper'

RSpec.feature "Posts", type: :feature do
  describe "index" do
    it "can be reached successfully" do
      visit posts_path

      expect(page.status_code).to eq(200)
    end

    it "has title of 'Posts'" do
      user = create(:user)

      login_as(user)

      visit posts_path

      expect(page).to have_content "Posts"
    end

    it "has a list of posts" do
      user  = create(:user)
      post1 = create(:post, user: user, rationale: "Test Post 1")
      post2 = create(:post, user: user, rationale: "Test Post 2")

      login_as(user)

      visit posts_path

      expect(page).to have_content(post1.rationale)
      expect(page).to have_content(post2.rationale)
    end
  end

  describe "creation" do
    it "has a new form that can be reached" do
      visit new_post_path

      expect(page.status_code).to eq(200)
    end

    it "can be created from new form page" do
      user = create(:user)

      login_as(user)

      visit new_post_path

      fill_in "post[date]",      with: Time.zone.now
      fill_in "post[rationale]", with: "Some rationale"

      click_on "Save"

      expect(page).to have_content("Some rationale")
    end

    it "will have a user associated" do
      user = create(:user)

      login_as(user)

      visit new_post_path

      fill_in "post[date]",      with: Time.zone.now
      fill_in "post[rationale]", with: "user_association"

      click_on "Save"

      expect(user.posts.last.rationale).to eq("user_association")
    end
  end
end
