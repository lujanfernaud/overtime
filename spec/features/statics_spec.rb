require 'rails_helper'

RSpec.feature "Static Pages", type: :feature do
  describe "navigate" do
    describe "homepage" do
      it "can be reached successfully" do
        visit root_path

        expect(page.status_code).to eq(200)
      end
    end
  end
end
