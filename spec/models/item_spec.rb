require 'rails_helper'

RSpec.describe Item, type: :model do
  describe '商品登録' do
    before do
      @item = FactoryBot.build(:item)
    end
    context '商品登録ができる時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@item).to be_valid
      end
    end

    context '商品登録ができない時' do
      it 'productが空では登録できない' do
        @item.product = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("Product can't be blank")
      end
      it 'textが空では登録できない' do
        @item.text = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("Text can't be blank")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it 'status_idが空では登録できない' do
        @item.status_id = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("Status can't be blank")
      end
      it 'sipping_idが空では登録できない' do
        @item.sipping_id = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("Sipping can't be blank")
      end
      it 'area_idが空では登録できない' do
        @item.area_id = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it 'day_idが空では登録できない' do
        @item.day_id = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("Day can't be blank")
      end
      it 'priceが空では登録できない' do
        @item.price = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end
      it 'imageが空では登録できない' do
        @item.image = nil  
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it 'userが空では登録できない' do
        @item.user = nil  
        @item.valid?
        expect(@item.errors.full_messages).to include("User must exist")
      end
      it 'category_idが1では登録できない' do
        @item.category_id = '1'  
        @item.valid?
        expect(@item.errors.full_messages).to include("Category must be other than 1")
      end
      it 'status_idが1では登録できない' do
        @item.status_id = '1'  
        @item.valid?
        expect(@item.errors.full_messages).to include("Status must be other than 1")
      end
      it 'sipping_idが1では登録できない' do
        @item.sipping_id = '1'  
        @item.valid?
        expect(@item.errors.full_messages).to include("Sipping must be other than 1")
      end
      it 'area_idが1では登録できない' do
        @item.area_id = '1'  
        @item.valid?
        expect(@item.errors.full_messages).to include("Area must be other than 1")
      end
      it 'day_idが1では登録できない' do
        @item.day_id = '1'  
        @item.valid?
        expect(@item.errors.full_messages).to include("Day must be other than 1")
      end
      it 'priceが299以下では登録できない' do
        @item.price = '299'  
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end
      it 'priceが10000000以上では登録できない' do
        @item.price = '10000000'  
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end
    end
  end
end 
