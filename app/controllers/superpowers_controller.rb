class SuperpowersController < ApplicationController

  # GET /superpowers
  def index
      @superpowers = Superpower.all
  end

  # GET /superpowers/1
  def show
    @superpower = Superpower.find(params[:id])
  end
end
