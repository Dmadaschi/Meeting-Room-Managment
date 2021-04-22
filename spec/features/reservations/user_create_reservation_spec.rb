require 'rails_helper'

feature 'User create reservation' do
  before do
    travel_to Time.zone.local(2021, 4, 19, 0, 1)
    login_as(create(:user, username: 'José'))
    visit root_path
  end
  context 'for this week' do
    scenario 'monday 6:00' do
      find('#6-1-link').click

      expect(Reservation.last.user.username).to eq('José')
      expect(Reservation.last.reservation_datetime.to_s)
        .to eq('2021-04-20 06:00:00 UTC')
    end
  end
end
