require 'rails_helper'

RSpec.describe "As a registered user", js: true do

  context "When I visit the home page" do
    before :each do 
      @user = User.create(email: "BOB", password: "RULES")
      page.set_rack_session(user_id: @user.id)
    end

    it "I see a form to submit a link" do 
      visit root_path
      expect(page).to have_field("Url")
      expect(page).to have_field("Title")
    end

    it "I save a link" do 
      visit root_path
      fill_in "link[url]", with: "https://www.google.com"
      fill_in "link[title]", with: "search"
      click_on "Submit"
      expect(page).to have_content("url: https://www.google.com")
      expect(page).to have_content("title: search")
      expect(page).to have_content("status: false")
    end

    it "I cannot save an invalid link" do 
      visit root_path
      fill_in "link[url]", with: "www.google.com"
      fill_in "link[title]", with: "search"
      click_on "Submit"
      expect(page).not_to have_content("www.google.com")
    end

    it "I see my links and not other user links" do 
      @user2 = User.create(email: "APRIL", password: "RULES")
      link1 = @user.links.create(url: "https://www.google.com", title: "search")
      link2 = @user2.links.create(url: "https://www.yahoo.com", title: "party")
      visit root_path
      expect(page).to have_content("search")
      expect(page).not_to have_content("party")
    end
  end
end