class SuperpowersController < ApplicationController
  before_action :set_superpower, only: [:show]

  # GET /superpowers
  def index
    @superpowers = Superpower.all
  end

  # GET /superpowers/1
  def show
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
      redirect_to superpower_path(@superpower)
    else
      render :new
    end
  end

  private

  def set_superpower
    @superpower = Superpower.find(params[:id])
  end

  def superpower_params
    params.require(:superpower).permit(:name, :description, :superpower_category_id, :price, :image)
  end

end
