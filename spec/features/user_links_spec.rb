require 'rails_helper'

RSpec.describe "As a registered user", :js => :true do
  context "When I visit the home page" do
    before :each do 
      @user = User.create(email: "BOB", password: "RULES")
      page.set_rack_session(user_id: @user.id)
    end

    it "I'll see a form to submit a link" do 

    end
  end
end