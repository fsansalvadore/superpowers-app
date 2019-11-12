class BookingsController < ApplicationController

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def booking_params
    params.require(:booking).permit(:start_date, :end_date)
  end

   # t.date "start_date"
   #  t.date "end_date"
   #  t.bigint "superpower_id"
   #  t.bigint "rentee_id"

end
