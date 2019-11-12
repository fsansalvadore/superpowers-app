class SuperpowersController < ApplicationController
  before_action :set_superpower, only: [:show]

  # GET /superpowers
  def index
      @superpowers = Superpower.all
  end

  # GET /superpowers/1
  def show
  end

  def new
    @superpower = Superpower.new
  end

  def create
  end

  private

  def set_superpower
    @superpower = Superpower.find(params[:id])
  end

end
