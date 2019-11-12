class SuperpowersController < ApplicationController

  # GET /superpowers
  def index
      @superpowers = Superpower.all
  end

  # GET /superpowers/1
  def show
    @superpower = Superpower.find(params[:id])
    @superpower_categories = SuperpowerCategory.all
    @superpower_category = @superpower_categories.superpower
    @booking = Booking.new
  end

end
