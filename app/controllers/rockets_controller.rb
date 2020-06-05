class RocketsController < ApplicationController
  before_action :find_rocket, only: [:show, :edit, :update, :destroy]
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @rockets = Rocket.all
    if params[:query].present?
      @rockets = Rocket.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @rockets = Rocket.all
    end
    @markers = @rockets.geocoded.map do |rocket|
      {
        lat: rocket.latitude,
        lng: rocket.longitude,
        image_url: helpers.asset_url('https://img.icons8.com/plasticine/100/000000/rocket.png')
      }
    end
  end

  def new
    @rocket = Rocket.new
    @order = Order.new
  end

  def create
    @rocket = Rocket.new(rocket_params)
    @user = current_user
    @rocket.user = @user
    if @rocket.save
      redirect_to rocket_path(@rocket)
    else
      render :new
    end
  end

  def show
    @review = Review.new
    @order = Order.new
    @user = User.new
    # @rocket = Rocket.geocoded
    @markers = [{
      lat: @rocket.latitude,
      lng: @rocket.longitude,
      image_url: helpers.asset_url('https://img.icons8.com/plasticine/100/000000/rocket.png')
    }]
  end

  def edit; end

  def update
    @rocket.update(rocket_params)
    if @rocket.save
      redirect_to rocket_path(@rocket)
    else
      redirect_to edit_rocket_path(@rocket), alert: @rocket.errors.full_messages
    end
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
    params.require(:rocket).permit(:name, :payload, :price, :description, :location, rocket_images: [])
  end
end
