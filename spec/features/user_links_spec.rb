require 'rails_helper'

RSpec.describe "As a registered user", js: true do

  context "With added links in my urlockbox" do 
    before :each do 
      @user = User.create(email: "BOB", password: "RULES")
      @link = @user.links.create(url:"https://www.google.com", title: "search")
      page.set_rack_session(user_id: @user.id)
    end

    it "I can edit the title or url of my link" do 
      visit root_path
      expect(page).to have_content("search")
      click_on "edit"
      expect(current_path).to eq(edit_link_path(@link))
      fill_in "link[url]", with: "https://www.yahoo.com"
      fill_in "link[title]", with: "party"
      click_on "Update"
      expect(current_path).to eq(root_path)
      expect(page).to have_content("https://www.yahoo.com")
      expect(page).to have_content("party")
      expect(page).not_to have_content("https://www.google.com")
      expect(page).not_to have_content("search")
    end

    it "I can mark a link as read || unread" do 
      visit root_path
      expect(page).to have_content("status: false")
      expect(page).to have_content("Mark as Read")
      click_on "Mark as Read"
      expect(current_path).to eq(root_path)
      expect(page).to have_content("status: true")
      expect(page).to have_link("Mark as Unread")
      click_on "Mark as Unread"
      expect(page).to have_content("status: false")
      expect(page).to have_link("Mark as Read")
    end

    it "I can filter through my lists" do 
      visit root_path
      expect(page).to have_content("search")
      fill_in "filter-input", with: "fdsa"
      expect(page).not_to have_content("search")
    end
  end
end