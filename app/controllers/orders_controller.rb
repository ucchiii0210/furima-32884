class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :move_to_index_sold_out

  def index
    @item = Item.find(params[:item_id])
  end

  def create
    purchase = Purchase.create(purchase_params)
    order = Order.create(order_params(purchase))
    if order.valid?
      pay_item
      return redirect_to root_path
    else
      redirect_to item_orders_path
    end
  end

 private
  def purchase_params
    params.permit(:item_id).merge(user_id: current_user.id)
  end 

  def order_params(purchase)
    params.permit(:postal,:area_id,:city,:address ,:property,:tell).merge(token: params[:token],purchase_id: purchase[:id])
  end

  def pay_item
    item = Item.find(params[:item_id])
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: item.price,  
      card: params[:token],  
      currency: 'jpy'        
    )
  end

  def move_to_index_sold_out
    item = Item.find(params[:item_id])
    if item.purchase.present? || item.user_id == current_user.id
      redirect_to root_path
    end
  end

end



