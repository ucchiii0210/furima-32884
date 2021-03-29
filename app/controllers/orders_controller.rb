class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_item , only: [:index, :create,:move_to_index_sold_out, :pay_item]
  before_action :move_to_index_sold_out

  def index
    
    @purchase_order = PurchaseOrder.new
  end

  def create
    @purchase_order = PurchaseOrder.new(purchase_order_params)
    if @purchase_order.valid?
      pay_item
      @purchase_order.save
      return redirect_to root_path
    else
      render :index
    end
  end

 private

  def purchase_order_params
    params.require(:purchase_order).permit(:postal, :area_id, :city, :address, :property, :tell). merge(token: params[:token], user_id: current_user.id ,item_id: params[:item_id])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  
    Payjp::Charge.create(
      amount: @item.price,  
      card: params[:token],  
      currency: 'jpy'        
    )
  end

  def set_item
    @item = Item.find(params[:item_id])
  end

  def move_to_index_sold_out
    if @item.purchase.present? || @item.user_id == current_user.id
      redirect_to root_path
    end
  end


end



