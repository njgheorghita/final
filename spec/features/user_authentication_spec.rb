require "rails_helper"

RSpec.describe "as a visitor", :js => :true do
  context "When I go to the home page" do
    it "I should be redirected to a page with sign up or log in" do 
      visit '/'
      # expect redirect? 
      expect(page).to have_link("Sign Up")
      expect(page).to have_link("Log In")
    end
  end
end
