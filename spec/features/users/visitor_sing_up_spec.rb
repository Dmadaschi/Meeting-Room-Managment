require 'rails_helper'

feature 'User Sing up' do
  scenario 'successfully' do
    visit new_user_registration_path

    fill_in 'Username', with: 'José'
    fill_in 'Email', with: 'jose@baidu.com.br'
    fill_in 'Password', with: '123456'
    fill_in 'Password confirmation', with: '123456'
    click_on 'Sign up'

    expect(current_path).to eq(root_path)
  end
end
