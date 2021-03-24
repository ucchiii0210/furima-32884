class OrdersController < ApplicationController
  before_action :authenticate_user!

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to root_path
    else
      render :index
    end
  end

 private
  
  def order_params
    params.permit(:postal,:area_id,:city,:addresss,:property,:tell)
  end

end



