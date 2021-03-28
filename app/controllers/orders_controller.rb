class OrdersController < ApplicationController
  before_action :authenticate_user!

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
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: item.price,  # 商品の値段
      card: params[:token],    # カードトークン
      currency: 'jpy'                 # 通貨の種類（日本円）
    )
  end
end



