require 'rails_helper'

RSpec.describe Link, type: :model do
  describe 'validations' do
    context 'invalid attributes' do
      before :each do 
        @user = User.create(email: "BOB", password: "RULES")
      end

      it 'is invalid without a url' do
        link = @user.links.create(title:"search")

        expect(link).to be_invalid
      end

      it 'is invalid without a valid url' do
        link = @user.links.create(url: "invalid", title:"search")

        expect(link).to be_invalid
      end

      it 'is invalid without a title' do
        link = @user.links.create(url: "invalid")

        expect(link).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with all attributes' do
        @user = User.create(email: "BOB", password: "RULES")
        link = @user.links.create(url: "https://www.google.com", title:"search")

        expect(link).to be_valid
      end
    end
  end
end
