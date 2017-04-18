require "rails_helper"

RSpec.describe "As a visitor"do
  context "When I go to the home page" do
    it "I should be redirected to a page with sign up or log in" do 
      visit root_path
      expect(page).to have_content("Sign Up")
      expect(page).to have_content("Log In")
    end
  end

  context "When I click on Sign Up" do 
    it "I should be able to create an account" do 
      visit root_path
      click_on "Sign Up by clicking here"
      expect(current_path).to eq(new_user_path)
      fill_in "user[email]", with: "BOB"
      fill_in "user[password]", with: "RULES"
      fill_in "user[password_confirmation]", with: "RULES"
      click_on "Sign Up"
      expect(current_path).to eq(root_path)
      expect(page).to have_content("hey BOB")
    end

    it "I should not be able to create an account with an existing email" do 
      user = User.create(email: "BOB", password: "RULES")

      visit new_user_path
      fill_in "user[email]", with: user.email
      fill_in "user[password]", with: "SUCKS"
      fill_in "user[password_confirmation]", with: "SUCKS"
      click_on "Sign Up"
      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("That email is already in use")
    end

    it "I should not be able to create an account with empty fields" do 
      visit new_user_path
      fill_in "user[email]", with: "BOB"
      click_on "Sign Up"
      expect(current_path).to eq(new_user_path)
      expect(page).to have_content("Please fill out all fields")
    end

    # it "I should not be able to create an account without matching passwords"
  end
end
