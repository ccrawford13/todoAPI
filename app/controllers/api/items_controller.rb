class Api::ItemsController < ApiController
  before_action :authenticate_user

  def create
    list = List.find(params[:list_id])
    item = list.items.build(item_params)

    if item.save
      render json: item, status: :success
    else
      render json: { errors: item.errors.full_messages }, status: :unprocessabel_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:title, :completed)
  end
end
