class ItemsController < ApplicationController
  before_action :authenticate_user! , except:  :index
  def index
  end
  
  def new
    @item = Item.new
  end
  
  def create
    @item = Item.new(item_params)
    @item.save
    if @item.save
      redirect_to root_path(@item)
    else
      render :new
    end
  end


  private
  def item_params
    params.require(:item).permit(:product, :image, :text, :category_id, :status_id, :sipping_id, :area_id, :day_id, :price).merge(user_id: current_user.id)
  end



end
