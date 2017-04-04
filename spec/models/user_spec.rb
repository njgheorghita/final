require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'validations' do
    context 'invalid attributes' do
      it 'is invalid without an email' do
        user = User.new(password: "RULES")

        expect(user).to be_invalid
      end

      it 'has a unique email' do
        user = User.create(email: "BOB", password: "RULES")
        user_2 = User.new(email: "BOB", password: "RULES")

        expect(user_2).to be_invalid
      end

      it 'is invalid without a password' do
        user = User.new(email: "BOB")

        expect(user).to be_invalid
      end
    end

    context 'valid attributes' do
      it 'is valid with all attributes' do
        user = User.new(email: "BOB", password: "RULES")

        expect(user).to be_valid
      end
    end
  end
end
