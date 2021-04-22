require 'rails_helper'

feature 'User view reservations' do
  before do
    travel_to Time.zone.local(2021, 4, 21, 15, 15)
    login_as(create(:user, username: 'José'))
    visit root_path
  end
  context 'from this week' do
    scenario 'successfully' do
      expect(page).to have_content('Reserva de Sala')
      expect(page).to have_content('Usuário: José')
      expect(page).to have_content('Sair')
      expect(page).to have_content('Horário')
      expect(page).to have_content('Segunda - 19/04/2021')
      expect(page).to have_content('Terça - 20/04/2021')
      expect(page).to have_content('Quarta - 21/04/2021')
      expect(page).to have_content('Quinta - 22/04/2021')
      expect(page).to have_content('Sexta - 23/04/2021')
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
      expect(page).to have_content('Disponivel')
    end
  end

  context 'from past' do
    scenario 'first week' do
      click_on 'Semana anterior'

      expect(page).to have_content('Reserva de Sala')
      expect(page).to have_content('Usuário: José')
      expect(page).to have_content('Sair')
      expect(page).to have_content('Horário')
      expect(page).to have_content('Segunda - 12/04/2021')
      expect(page).to have_content('Terça - 13/04/2021')
      expect(page).to have_content('Quarta - 14/04/2021')
      expect(page).to have_content('Quinta - 15/04/2021')
      expect(page).to have_content('Sexta - 16/04/2021')
    end

    scenario '3 weeks' do
      click_on 'Semana anterior'
      click_on 'Semana anterior'
      click_on 'Semana anterior'

      expect(page).to have_content('Reserva de Sala')
      expect(page).to have_content('Usuário: José')
      expect(page).to have_content('Sair')
      expect(page).to have_content('Horário')
      expect(page).to have_content('Segunda - 29/03/2021')
      expect(page).to have_content('Terça - 30/03/2021')
      expect(page).to have_content('Quarta - 31/03/2021')
      expect(page).to have_content('Quinta - 01/04/2021')
      expect(page).to have_content('Sexta - 02/04/2021')
    end

    scenario 'and return to present week' do
      click_on 'Semana anterior'
      click_on 'Semana atual'

      expect(page).to have_content('Reserva de Sala')
      expect(page).to have_content('Usuário: José')
      expect(page).to have_content('Sair')
      expect(page).to have_content('Horário')
      expect(page).to have_content('Segunda - 19/04/2021')
      expect(page).to have_content('Terça - 20/04/2021')
      expect(page).to have_content('Quarta - 21/04/2021')
      expect(page).to have_content('Quinta - 22/04/2021')
    end
  end

  context 'from future' do
    scenario 'first week' do
      click_on 'Proxima semana'

      expect(page).to have_content('Reserva de Sala')
      expect(page).to have_content('Usuário: José')
      expect(page).to have_content('Sair')
      expect(page).to have_content('Horário')
      expect(page).to have_content('Segunda - 26/04/2021')
      expect(page).to have_content('Terça - 27/04/2021')
      expect(page).to have_content('Quarta - 28/04/2021')
      expect(page).to have_content('Quinta - 29/04/2021')
      expect(page).to have_content('Sexta - 30/04/2021')
    end

    scenario '3 weeks' do
      click_on 'Proxima semana'
      click_on 'Proxima semana'
      click_on 'Proxima semana'

      expect(page).to have_content('Reserva de Sala')
      expect(page).to have_content('Usuário: José')
      expect(page).to have_content('Sair')
      expect(page).to have_content('Horário')
      expect(page).to have_content('Segunda - 10/05/2021')
      expect(page).to have_content('Terça - 11/05/2021')
      expect(page).to have_content('Quarta - 12/05/2021')
      expect(page).to have_content('Quinta - 13/05/2021')
      expect(page).to have_content('Sexta - 14/05/2021')
    end

    scenario 'and return to present week' do
      click_on 'Semana anterior'
      click_on 'Semana atual'

      expect(page).to have_content('Reserva de Sala')
      expect(page).to have_content('Usuário: José')
      expect(page).to have_content('Sair')
      expect(page).to have_content('Horário')
      expect(page).to have_content('Segunda - 19/04/2021')
      expect(page).to have_content('Terça - 20/04/2021')
      expect(page).to have_content('Quarta - 21/04/2021')
      expect(page).to have_content('Quinta - 22/04/2021')
    end
  end
end
