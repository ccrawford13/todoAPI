class Api::ListsController < ApiController
  before_action :authenticate_user
  before_action :find_list, except: [:create]

  def create
    user = User.find(params[:user_id])
    list = user.lists.build(list_params)

    if list.save
      render json: list
    else
      render json: { errors: list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def update
    if @list.update_attributes(list_params)
      render json: @list
    else
      render json: { errors: @list.errors.full_messages }, status: :unprocessable_entity
    end
  end

  def destroy
    @list.destroy
    render json: {}, status: :no_content
  end

  private

  def find_list
    @list = List.find(params[:id])
  end

  def list_params
      params.require(:list).permit(:title, :permissions)
  end
end
