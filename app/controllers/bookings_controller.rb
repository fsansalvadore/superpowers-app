class BookingsController < ApplicationController
  before_action :set_booking, only: [:edit, :update, :destroy]

  def create
    @booking = Booking.new(booking_params)
    @booking.rentee = current_user
    @booking.superpower_id = params[:superpower_id]
    if @booking.save
      redirect_to profile_path, notice: "Booking successful"
    else
      render template: 'superpowers/show'
    end
  end

  def destroy
    # TODO: To be done when profile page has been created
  end

  private

  def set_booking
    @booking = Booking.find(params[:id])
  end

  def booking_params
    params.require(:booking).permit(:start_date, :end_date, :price)
  end
end
