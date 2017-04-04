require 'rails_helper'

RSpec.describe "As a registered user", :js => :true do
  context "When I try to sign in" do
    before :each do 
      @user = User.create(email: "BOB", password: "RULES")
      visit login_path
      expect(page).to have_content("Log In")
    end

    it "I'll see a success message if correct info entered" do 
      fill_in "user[email]", with: @user.email
      fill_in "user[password]", with: @user.password
      click_on "Login"
      expect(current_path).to eq(root_path)
      expect(page).to have_content("hey BOB")
      expect(page).to have_content("Successfully logged in")
    end

    it "I'll see an error message if incorrect info entered" do 
      fill_in "user[email]", with: @user.email
      click_on "Login"
      expect(current_path).to eq(login_path)
      expect(page).to have_content("Please try again")
    end
  end

  context "When I'm on the home page" do 
    it "I should see a link to Sign Out" do 
      @user = User.create(email: "BOB", password: "RULES")
      visit login_path
      fill_in "user[email]", with: @user.email
      fill_in "user[password]", with: @user.password
      click_on "Login"
      expect(page).to have_link("Sign Out")
      expect(page).not_to have_link("Sign In")
      click_on "Sign Out"
      expect(current_path).to eq(login_path)
      expect(page).not_to have_link("Sign Out")
    end
  end
end