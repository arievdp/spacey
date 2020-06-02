class ReviewsController < ApplicationController
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    order = Order.find(params[:order_id])
    rocket = Rocket.find(order.rocket.id)
    @review.order = order
    if @review.save
      redirect_to rocket_path(rocket)
    else
      render :new
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
