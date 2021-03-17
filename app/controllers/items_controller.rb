class ItemsController < ApplicationController
  before_action :authenticate_user! , except:  [:index ,:show]
  def index
    @items = Item.all
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @item = Item.find(params[:id])
  end



  private
  def item_params
    params.require(:item).permit(:product, :image, :text, :category_id, :status_id, :sipping_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end

end