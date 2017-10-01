class UsersController < ApplicationController
  before_action :set_user, only: :show

  def index
    @users = User.all
    render_api(@users)
  end

  def show
    render_api(@user)
  end

  def create
    @user = User.new(user_params)
    @user.save
    render_api(@user)
  end

  private
  def set_user
    @user = User.find(params[:uid])
  end

  def user_params
    params.require(:user).permit(:uid, :name, :email, :username, :avatar)
  end
end