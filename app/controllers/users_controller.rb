class UsersController < ApplicationController
  def dashboard
    @user = current_user
  end

  def show
    @rocket = Rocket.new
  end
    
end
