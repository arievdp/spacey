class ReviewsController < ApplicationController
  def new
    @rocket = Rocket.find(params[:rocket_id])
    @review = Review.new
  end

  def create
    @rocket = Rocket.find(params[:rocket_id])
    @review = Review.new(review_params)
    @review.rocket = @rocket
    if @review.save
      redirect_to rocket_path(@rocket)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end