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

    it "shows post status" do
      user = create(:user)
      create(:post, :approved, user: user)
      create(:post, :rejected, user: user)

      login_as(user)

      visit posts_path

      expect(page).to have_content("Approved")
      expect(page).to have_content("Rejected")
    end
  end

  describe "new post" do
    it "has a link from the home page" do
      user = create(:user)

      login_as(user)

      visit root_path

      click_link "new-post-link"

      expect(page.status_code).to eq(200)
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

  describe "edition" do
    it "can be reached by clicking 'edit' on the index page" do
      user = create(:user)
      post = create(:post, user: user)

      login_as(user)

      visit posts_path

      within ".post_#{post.id}" do
        click_link "Edit"
      end

      expect(page.status_code).to eq(200)
    end

    it "can be edited by author" do
      user = create(:user)
      post = create(:post, user: user)

      login_as(user)

      visit edit_post_path(post)

      fill_in "post[rationale]", with: "Updated rationale."

      click_on "Save"

      expect(page).to have_content("Updated rationale.")
    end

    it "can be edited by admin" do
      user = create(:user, :admin)
      post = create(:post)

      login_as(user)

      visit edit_post_path(post)

      fill_in "post[rationale]", with: "Updated rationale."

      click_on "Save"

      expect(page).to have_content("Updated rationale.")
    end
  end

  describe "delete" do
    before do
      user = create(:user)

      login_as(user)
    end

    it "can be deleted" do
      post = create(:post)

      visit posts_path

      within ".post_#{post.id}" do
        click_link "Delete"
      end
    end
  end
end
