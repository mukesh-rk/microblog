class SessionsController < ApplicationController
  include SessionsHelper
  include UsersHelper
  def new

  end

  def create
  	@user = User.find_by_email(params[:sessions][:email])
    if @user && @user.authenticate(params[:sessions][:password])
      sign_in @user
      #redirect_to '/users/show' 
      return
      else
        flash.now[:error] = 'Invalid email/password combination'
        render 'new'
    end
  end

  def destroy
  	sign_out
    redirect_to root_url
  end
  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_url, notice: "Please sign in."
    end
  end
end
