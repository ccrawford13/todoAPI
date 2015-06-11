class Api::ListsController < ApiController
  before_action :authenticate_user

  def create
    user = User.find(params[:user_id])
    list = user.lists.build(list_params)

    if list.save
      render json: list, status: :success
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessabel_entity
    end
  end

  def destroy
    list = List.find(params[:id])
    list.destroy
    render json: {}, status: :no_content
  end

  private

  def list_params
      params.require(:list).permit(:title)
  end
end
