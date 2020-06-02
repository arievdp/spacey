class OrdersController < ApplicationController
before_action :find_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
    @user = current_user
  end

  def create
    @order = Order.new(order_params)
    @rocket = Rocket.find(params[:rocket_id])
    @user = current_user
    @order.rocket = @rocket
    @order.user = @user
    total_price = price_calculator(@order)
    @order.total_price = total_price
    if @order.save
      redirect_to dashboard_users_path
    else
      render :new
    end
  end

  def show
    @review = Review.new
  end

  def edit
    @review = Review.new
  end

  def update
    @order.update(order_params)
    if @order.save!
      redirect_to dashboard_users_path
    else
      render :new
    end
  end

  def destroy
    @order.destroy
    redirect_to dashboard_users_path
  end

  private

  def find_order
    @order = Order.find(params[:id])
  end

  # Need a method to check if a rocket is booked ??
  # def is_rocket_available?
  # end

  def order_params
    params.require(:order).permit(:rocket_id, :user_id, :start_date, :end_date, :status)
  end

  # Need to use date ranges in Ruby
  def price_calculator(order)
    days_hire = (order.end_date - order.start_date).to_i
    total_price = order.rocket.price.to_i * days_hire
    return total_price
  end
end
