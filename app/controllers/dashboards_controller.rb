class DashboardsController < ApplicationController

  def show
    @superpowers = Superpower.where(owner_id: current_user).order(created_at: :desc)
    @bookings = Booking.where(rentee_id: current_user).order(created_at: :desc)
  end

end
