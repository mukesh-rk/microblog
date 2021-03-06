class UsersController < ApplicationController
  include SessionsHelper
  include UsersHelper
  def new
  	@user = User.new
  end

  def create
    user = User.new(params[:user])
    if user.save
    	sign_in user
      	flash[:success] = "Welcome to homepage!"
      	#redirect_to @user
    else
      render 'new'
    end
  end
end
