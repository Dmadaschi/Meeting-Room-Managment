class ReservationsController < ApplicationController
  def index
    @week = week.all_week.to_a.map { |day| day.strftime("%d/%m/%Y") }
    @reservations = week_reservations(@week)
  end

  def create
    Reservation.new(reservation_params).save
    redirect_to action: :index
  end

  private

  def week_reservations(week)
    Reservation.where('reservation_datetime between ? and ?',
                      week.first.to_datetime, week.last.to_datetime)
  end

  def reservation_params
    {
      user: current_user,
      reservation_datetime: reservation_datetime
    }
  end

  def reservation_datetime
    params[:day].to_datetime.change({ hour: params[:time].to_i })
  end

  def week
    return Date.today if params[:week].blank?

    if params[:operation].eql?('last')
      params[:week].first.to_date.last_week
    else
      params[:week].first.to_date.next_week
    end
  end
end
