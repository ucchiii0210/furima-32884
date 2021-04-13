require 'rails_helper'

RSpec.describe PurchaseOrder, type: :model do
  describe '購入機能' do
    before do
      @item = FactoryBot.create(:item)
      @user = FactoryBot.create(:user)
      @order = FactoryBot.build(:purchase_order,item_id: @item.id,user_id: @user.id)
      sleep(1) #処理速度でエラーになるときがあるので
    end

    context '購入ができる時' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@order).to be_valid
      end
      it 'propertyが空でも購入できること' do
        @order.property = '' 
        expect(@order).to be_valid
      end
    end

    context '購入ができない時' do
      it 'postalが空では購入できない' do
        @order.postal = ''  
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号を入力してください")
      end
      it 'area_idが空では購入できない' do
        @order.area_id = ''  
        @order.valid?
        expect(@order.errors.full_messages).to include("都道府県を入力してください")
      end
      it 'cityが空では購入できない' do
        @order.city = ''  
        @order.valid?
        expect(@order.errors.full_messages).to include("市区町を入力してください")
      end
      it 'addressが空では購入できない' do
        @order.address = ''  
        @order.valid?
        expect(@order.errors.full_messages).to include("番地を入力してください")
      end
      it 'tellが空では購入できない' do
        @order.tell = ''  
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号を入力してください")
      end
      it 'tokenが空では購入できない' do
        @order.token = ''  
        @order.valid?
        expect(@order.errors.full_messages).to include("カード情報を正しくを入力してください")
      end
      it 'user_idが空では購入できない' do
        @order.user_id = ''  
        @order.valid?
        expect(@order.errors.full_messages).to include("Userを入力してください")
      end
      it 'item_idが空では購入できない' do
        @order.item_id = ''  
        @order.valid?
        expect(@order.errors.full_messages).to include("Itemを入力してください")
      end
      it 'postalがハイフン(-)無しでは購入できない' do
        @order.postal = '1111111'  
        @order.valid?
        expect(@order.errors.full_messages).to include("郵便番号はハイフン（ー）を入れてください")
      end
      it 'tellが11桁か10桁でないと購入できない' do
        @order.tell = '1111111'  
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'tellが12桁以上では購入できない' do
        @order.tell = '123456789012'  
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'tellが英数混合では購入できない' do
        @order.tell = '1a2b3c4d5e6'  
        @order.valid?
        expect(@order.errors.full_messages).to include("電話番号は不正な値です")
      end
      it 'area_idが--購入できない' do
        @order.area_id = 1  
        @order.valid?
        expect(@order.errors.full_messages).to include("都道府県は1以外の値にしてください")
      end
    end
  end
end
