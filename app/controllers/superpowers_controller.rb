class SuperpowersController < ApplicationController
  before_action :set_superpower, only: [:show]

  # GET /superpowers
  def index
    @superpowers = Superpower.all
  end

  # GET /superpowers/1
  def show
    # Needed to render the booking form on the superpower show page
    @booking = Booking.new
  end

  # GET /superpowers/new
  def new
    @superpower = Superpower.new
  end

  # POST /superpowers
  def create
    @superpower = Superpower.new(superpower_params)
    @superpower.owner = current_user
    if @superpower.save
      redirect_to superpower_path(@superpower), notice: "Superpower successfully created"
    else
      render :new
    end
  end

  def destroy
    @superpower = Superpower.find(params[:id])
    @superpower.destroy
    redirect_to profile_path, notice: "Superpower successfully deleted incl. any associated bookings"
  end

  private

  def set_superpower
    @superpower = Superpower.find(params[:id])
  end

  def superpower_params
    params.require(:superpower).permit(:name, :description, :superpower_category_id, :price, :image)
  end
end
