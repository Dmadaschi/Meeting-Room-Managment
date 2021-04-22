class ReservationsController < ApplicationController
  def index
    @week = week.all_week.to_a.map { |day| day.strftime("%d/%m/%Y") }
  end

  private

  def week
    return Date.today if params[:week].blank?

    if params[:operation].eql?('last')
      params[:week].first.to_date.last_week
    else
      params[:week].first.to_date.next_week
    end
  end
end
