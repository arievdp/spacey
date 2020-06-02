class OrdersController < ApplicationController
before_action :find_order, only: [:show, :edit, :update, :destroy]

  def index
    @orders = Order.all
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    total_price = price_calculator(order.start_date, order.end_date, @order)
    order.total_price = total_price
    if @order.save!
      redirect_to dashboard_users
    else
      render :new
    end
  end

  def show; end

  def edit; end

  def update
    @order.update(order_params)
    if @order.save!
      redirect_to dashboard_users
    else
      render :new
    end
  end

  def destroy
    @order.destroy
    redirect_to order_path
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
  def price_calculator(start_date, end_date, order)
    price = order.rocket.price
    days_of_hire = end_date - start_date
    return price * days_of_hire
  end
end
