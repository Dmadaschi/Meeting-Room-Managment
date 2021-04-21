require 'rails_helper'

feature 'Validates reservations access' do
  context 'User singed in and' do
    before do
      user = create(:user)
      login_as(user, scope: :user)
    end
    scenario 'view index' do
      visit root_path

      expect(current_path).to eq(root_path)
    end
  end
  context 'User not singed in and do not' do
    scenario 'view index' do
      visit root_path

      expect(current_path).not_to eq(root_path)
      expect(current_path).to eq(new_user_session_path)
    end
  end
end
