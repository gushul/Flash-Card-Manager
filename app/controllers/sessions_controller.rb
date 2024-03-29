class SessionsController < ApplicationController

  def new
  end
  
  def create
    user = User.find_by(email: params[:session][:email])
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_to root_path, notice: "You signed in"
    else
      redirect_to signin_path, alert: "Invalid email/password"
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
