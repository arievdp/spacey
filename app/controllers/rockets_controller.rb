class RocketsController < ApplicationController
  before_action :find_rocket, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @rockets = Rocket.all
  end

  def new
    @rocket = Rocket.new
    @order = Order.new
  end

  def create
    @rocket = Rocket.new(rocket_params)
    @user = current_user
    @rocket.user = @user
    if @rocket.save!
      redirect_to rocket_path(@rocket)
    else
      render :new
    end
  end

  def show
    @review = Review.new
    @order = Order.new
    @user = User.new
  end

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

  def rocket_params
    params.require(:rocket).permit(:name, :payload, :price, :description, :location)
  end
end
