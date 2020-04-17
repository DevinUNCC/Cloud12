class SessionsController < ApplicationController
  # new doesn't need instance variables because no model is created
  def new
  end

  # login form submits to the create action
  def create
    # first get email out of login parameters and check dbase for it
    user = User.find_by_email(params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to root_url, notice: "Logged in!"
    else
      flash.now[:alert] = "Email or password is invalid"
      render "new"
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to root_url, notice: "Logged out!"
  end
end
