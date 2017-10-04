class Api::UsersController < Api::ApiBaseController
  before_action :set_user, only: :show

  def index
    @users = User.all_except(current_user)
    render_api(@users)
  end

  def show
    render_api(@user)
  end

  private
  def set_user
    @user = User.find(params[:uid])
  end
end