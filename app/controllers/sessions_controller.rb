class SessionsController < ApplicationController
  def new
  end

  def create
      # Log the user in and redirect to the user's show page
    if user= User.authenticate_with_credentials(params[:email], params[:password])
      session[:user_id] = user.id
      redirect_to '/'
    else
      flash.now[:danger] = 'Invalid email/password combination' # Not quite right!
      redirect_to '/login'
    end
  end

  def destroy
    session[:user_id] = nil
    redirect_to '/login'
  end
end
