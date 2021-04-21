require 'rails_helper'

feature 'User view reservations' do
  before do
    login_as(create(:user, username: 'José'))
    visit root_path
  end
  scenario 'successfully' do
    expect(page).to have_content('Reserva de Sala')
    expect(page).to have_content('Usúario: José')
    expect(page).to have_content('Sair')
  end
end
