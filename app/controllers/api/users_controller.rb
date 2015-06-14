class Api::UsersController < ApiController
  before_action :authenticate_user

  def index
    users = User.all
    render json: users, each_serializer: UserSerializer
  end

  def create
    user = User.new(user_params)
    # user.password = params[:password]
    if user.save
      render json: user
    else
      render json: { errors: user.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    user = @current_user
    user.destroy
    render json: {}, status: :no_content
  end

  private

  def user_params
    params.require(:user).permit(:first_name, :last_name, :user_name, :email, :password, :password_confirmation)
  end
end
