module Admin::V1
  class UsersController < ApiController
  
    def index
      scope_without_current_user = User.all.where.not(id: @current_user.id)
      @users = scope_without_current_user
    end

    def show; end

    private

    def load_user
      @user = User.find(params[:id])
    end

    def user_params
      return {} unless params.has_key?(:user)
      params.require(:user).permit(:name, :email, :password, :password_confirmation)
    end
  end
end