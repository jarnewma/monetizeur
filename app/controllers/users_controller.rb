
class  UsersController < ApplicationController
  def index         # GET /users
    @users = User.all
  end

  def show          # GET /users/:id
    @user = User.find(params[:id])
    @subscription = @user.subscriptions.new
  end


  def update
    @user = User.find(params[:id])
    @user.update(user_params)
  end

  private

  def user_params
    params.require(:user).permit(:email, :first_name, :dob, :last_name)
  end
end
