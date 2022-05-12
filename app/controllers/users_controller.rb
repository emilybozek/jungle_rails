class UsersController < ApplicationController

  def new
  end

  def create
    user = User.new(user_params)
    user.errors[:first_name]
    user.errors[:last_name]
    user.errors[:password]
    user.errors[:password_confirmation]
    if user.save
      session[:user_id] = user.id
      redirect_to '/'
      flash[:message] = "Your Account was Created Successfully!"
    else
      flash[:messages] = user.errors.full_messages
      redirect_to '/signup'
    end
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :email, :password, :password_confirmation)
  end

end