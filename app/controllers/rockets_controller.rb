class RocketsController < ApplicationController
  before_action :find_rocket, only: [:show, :edit, :update, :destroy]

  def index
    @rockets = Rocket.all
  end

  def new
    @rocket = Rocket.new
  end

  def create
    @rocket = Rocket.new(rocket_params)
    if @rocket.save!
      redirect_to rocket_path(@rocket)
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    @rocket.update(rocket_params)
    @rocket.save!

    redirect_to rocket_path(@rocket)
  end

  def destroy
    @rocket.destroy

    redirect_to rockets_path
  end

  private

  def find_rocket
    @rocket = Rocket.find(params[:id])
  end

  def review_params
    params.require(:rocket).permit(:name, :payload, :price, :description, :loaction)
  end
end
