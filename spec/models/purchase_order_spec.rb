require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  describe '購入機能' do
    before do
      @order = FactoryBot.build(:purchase_order)
    end
    context '購入ができる時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@order).to be_valid
      end
    end

    context '購入ができない時' do
      it 'postalが空では購入できない' do
        @order.postal = ''  
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal can't be blank")
      end
      it 'area_idが空ではvできない' do
        @order.area_id = ''  
        @order.valid?
        expect(@order.errors.full_messages).to include("Area can't be blank")
      end
      it 'cityが空では購入できない' do
        @order.city = ''  
        @order.valid?
        expect(@order.errors.full_messages).to include("City can't be blank")
      end
      it 'addressが空ではvできない' do
        @order.address = ''  
        @order.valid?
        expect(@order.errors.full_messages).to include("Address can't be blank")
      end
      it 'tellが空では購入できない' do
        @order.tell = ''  
        @order.valid?
        expect(@order.errors.full_messages).to include("Tell can't be blank")
      end
      it 'tokenが空では購入できない' do
        @order.token = ''  
        @order.valid?
        expect(@order.errors.full_messages).to include("Token can't be blank")
      end
      it 'postalがハイフン(-)無しでは購入できない' do
        @order.postal = '1111111'  
        @order.valid?
        expect(@order.errors.full_messages).to include("Postal is invalid. Include hyphen(-)")
      end
      it 'tellが11桁か10桁でないと購入できない' do
        @order.tell = '1111111'  
        @order.valid?
        expect(@order.errors.full_messages).to include("Tell is invalid")
      end
    end
  end
end
