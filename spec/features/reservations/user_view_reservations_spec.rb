require 'rails_helper'

feature 'User view reservations' do
  before do
    login_as(create(:user, username: 'José'))
    visit root_path
  end
  scenario 'successfully' do
    expect(page).to have_content('Reserva de Sala')
    expect(page).to have_content('Usuário: José')
    expect(page).to have_content('Sair')
    expect(page).to have_content('Horário')
    expect(page).to have_content('Segunda')
    expect(page).to have_content('Terça')
    expect(page).to have_content('Quarta')
    expect(page).to have_content('Quinta')
    expect(page).to have_content('6:00')
    expect(page).to have_content('7:00')
    expect(page).to have_content('8:00')
    expect(page).to have_content('9:00')
    expect(page).to have_content('10:00')
    expect(page).to have_content('11:00')
    expect(page).to have_content('12:00')
    expect(page).to have_content('13:00')
    expect(page).to have_content('14:00')
    expect(page).to have_content('15:00')
    expect(page).to have_content('16:00')
    expect(page).to have_content('17:00')
    expect(page).to have_content('18:00')
    expect(page).to have_content('19:00')
    expect(page).to have_content('20:00')
    expect(page).to have_content('21:00')
    expect(page).to have_content('22:00')
    expect(page).to have_content('23:00')
  end
end
