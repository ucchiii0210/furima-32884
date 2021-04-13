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
        expect(@item.errors.full_messages).to include("商品名を入力してください")
      end
      it 'textが空では登録できない' do
        @item.text = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("商品説明を入力してください")
      end
      it 'category_idが空では登録できない' do
        @item.category_id = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーを入力してください")
      end
      it 'status_idが空では登録できない' do
        @item.status_id = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態を入力してください")
      end
      it 'sipping_idが空では登録できない' do
        @item.sipping_id = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担を入力してください")
      end
      it 'area_idが空では登録できない' do
        @item.area_id = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域を入力してください")
      end
      it 'day_idが空では登録できない' do
        @item.day_id = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数を入力してください")
      end
      it 'priceが空では登録できない' do
        @item.price = ''  
        @item.valid?
        expect(@item.errors.full_messages).to include("価格を入力してください")
      end
      it 'imageが空では登録できない' do
        @item.image = nil  
        @item.valid?
        expect(@item.errors.full_messages).to include("画像を入力してください")
      end
      it 'userが空では登録できない' do
        @item.user = nil  
        @item.valid?
        expect(@item.errors.full_messages).to include("Userを入力してください")
      end
      it 'category_idが1では登録できない' do
        @item.category_id = 1 
        @item.valid?
        expect(@item.errors.full_messages).to include("カテゴリーは1以外の値にしてください")
      end
      it 'status_idが1では登録できない' do
        @item.status_id = 1 
        @item.valid?
        expect(@item.errors.full_messages).to include("商品の状態は1以外の値にしてください")
      end
      it 'sipping_idが1では登録できない' do
        @item.sipping_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("配送料の負担は1以外の値にしてください")
      end
      it 'area_idが1では登録できない' do
        @item.area_id = 1
        @item.valid?
        expect(@item.errors.full_messages).to include("発送元の地域は1以外の値にしてください")
      end
      it 'day_idが1では登録できない' do
        @item.day_id = 1 
        @item.valid?
        expect(@item.errors.full_messages).to include("発送までの日数は1以外の値にしてください")
      end
      it 'priceが299以下では登録できない' do
        @item.price = 299 
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は300以上の値にしてください")
      end
      it 'priceが10000000以上では登録できない' do
        @item.price = 10000000 
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は9999999以下の値にしてください")
      end
      it 'priceが値段が半角英数混合では登録できない' do
        @item.price = '111aaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
      it 'priceが値段が半角英語だけでは登録できない' do
        @item.price = 'aaaaaa'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
      it 'priceが値段が全角数字では登録できない' do
        @item.price = '３００'
        @item.valid?
        expect(@item.errors.full_messages).to include("価格は数値で入力してください")
      end
    end
  end
end 
