class RocketsController < ApplicationController
  before_action :find_rocket

  def index
  end

  def new
  end

  def create

  end

  def show
  end

  def edit

  end

  def update
  end

  def destroy

  end

  private

  def find_rocket
    @rocket = Rocket.find(params[:id])
  end

  def review_params
    # params.require(:review).permit(:content)
  end
end
