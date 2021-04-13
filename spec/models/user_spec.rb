require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end

    context 'ユーザー登録ができる時' do
      it 'すべての値が正しく入力されていれば保存できること' do
        expect(@user).to be_valid
      end
    end
    context 'ユーザー登録ができない時' do
      it 'nicknameが空では登録できない' do
        # nicknameが空では登録できないテストコードを記述します
        @user.nickname = ''  # nicknameの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        # emailが空では登録できないテストコードを記述します
        @user.email = ''  # emailの値を空にする
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it 'passwordが空では登録できない' do
        # passwordが空では登録できないテストコードを記述します
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'password_confirmationが空では登録できない' do
        # password_confirmationが空では登録できないテストコードを記述します
        @user.password_confirmation = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'first_nameが空では登録できない' do
        # first_nameが空では登録できないテストコードを記述します
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'last_nameが空では登録できない' do
        # last_nameが空では登録できないテストコードを記述します
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it 'first_name_kanaが空では登録できない' do
        # first_name_kanaが空では登録できないテストコードを記述します
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前フリガナを入力してください")
      end
      it 'last_name_kanaが空では登録できない' do
        # last_name_kanaが空では登録できないテストコードを記述します
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字フリガナを入力してください")
      end
      
      it '登録されいるemailでは登録できない' do
        # 登録されいるemailでは登録できないテストコードを記述します
        @user.save
        @another_user = FactoryBot.build(:user, email: @user.email)
        @another_user.valid?
        expect(@another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it '＠無しではemailは登録できない' do
        # ＠無しではemailは登録できないテストコードを記述します
        @user.email = 'aaa111aaa111aaa111.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'passwordが半角英語のみでは登録できない' do
        # passwordが空では登録できないテストコードを記述します
        @user.password = 'aaaaaa'
        @user.password_confirmation = 'aaaaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordが数字のみでは登録できない' do
        # passwordが空では登録できないテストコードを記述します
        @user.password = '111111'
        @user.password_confirmation = '111111'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordが全角では登録できない' do
        # passwordが空では登録できないテストコードを記述します
        @user.password = 'ａａａ１１１'
        @user.password_confirmation = 'ａａａ１１１'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは不正な値です")
      end
      it 'passwordが5文字以下では登録できない' do
        # passwordが空では登録できないテストコードを記述します
        @user.password = 'aaa11'
        @user.password_confirmation = 'aaa11'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードは6文字以上で入力してください")
      end
      it 'passwordとpassword_confirmationが不一致では登録できない' do
        # passwordとpassword_confirmationが不一致では登録できないテストコードを記述します
        @user.password = Faker::Internet.password(min_length: 100)
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'first_nameが英語では登録できない' do
        # first_nameが英語では登録できないテストコードを記述します
        @user.first_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("名前は不正な値です")
      end
      it 'last_nameが英語では登録できない' do
        # last_nameが英語では登録できないテストコードを記述します
        @user.last_name = 'aaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字は不正な値です")
      end
      it 'first_name_kanaがひらがなでは登録できない' do
        # first_name_kanaがひらがなでは登録できないテストコードを記述します
        @user.first_name_kana = @user.last_name
        @user.valid?
        expect(@user.errors.full_messages).to include("名前フリガナは不正な値です")
      end
      it 'last_name_kanaがひらがなでは登録できない' do
        # last_name_kanaがひらがなでは登録できないテストコードを記述します
        @user.last_name_kana = @user.last_name
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字フリガナは不正な値です")
      end
      it 'first_name_kanaが英語では登録できない' do
        # first_name_kanaが英語では登録できないテストコードを記述します
        @user.first_name_kana = Faker::Name.last_name
        @user.valid?
        expect(@user.errors.full_messages).to include("名前フリガナは不正な値です")
      end
      it 'last_name_kanaが英語では登録できない' do
        # last_name_kanaが英語では登録できないテストコードを記述します
        @user.last_name_kana = Faker::Name.last_name
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字フリガナは不正な値です")
      end
    end
  end
end
