require 'rails_helper'

feature 'User log in' do
  scenario 'successfully' do
    create(:user, username: 'José', email: 'jose@teste.com', password: '123456')
    visit root_path
    fill_in 'Email', with: 'jose@teste.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'

    expect(current_path).to eq(root_path)
    expect(page).to have_content('Reserva de Sala')
    expect(page).to have_content('Usuário: José')
    expect(page).to have_link('Sair')
  end
  scenario 'and log out' do
    create(:user, email: 'teste@teste.com', password: '123456')
    visit root_path
    fill_in 'Email', with: 'teste@teste.com'
    fill_in 'Password', with: '123456'
    click_on 'Log in'
    click_on 'Sair'

    expect(current_path).to eq(user_session_path)
  end
end
