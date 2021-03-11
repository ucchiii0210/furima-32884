require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'ユーザー新規登録' do
    before do
      @user = FactoryBot.build(:user)
    end
    it 'nicknameが空では登録できない' do
      # nicknameが空では登録できないテストコードを記述します
      @user.nickname = ''  # nicknameの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'emailが空では登録できない' do
      # emailが空では登録できないテストコードを記述します
      @user.email = ''  # emailの値を空にする
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end
    it 'passwordが空では登録できない' do
      # passwordが空では登録できないテストコードを記述します
      @user.password = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'password_confirmationが空では登録できない' do
      # password_confirmationが空では登録できないテストコードを記述します
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'first_nameが空では登録できない' do
      # first_nameが空では登録できないテストコードを記述します
      @user.first_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name can't be blank")
    end
    it 'last_nameが空では登録できない' do
      # last_nameが空では登録できないテストコードを記述します
      @user.last_name = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name can't be blank")
    end
    it 'first_name_kanaが空では登録できない' do
      # first_name_kanaが空では登録できないテストコードを記述します
      @user.first_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank")
    end
    it 'last_name_kanaが空では登録できない' do
      # last_name_kanaが空では登録できないテストコードを記述します
      @user.last_name_kana = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank")
    end
    
    it '登録されいるemailでは登録できない' do
      # 登録されいるemailでは登録できないテストコードを記述します
      @user.save
      @another_user = FactoryBot.build(:user, email: @user.email)
      @another_user.valid?
      expect(@another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'passwordが半角英語のみでは登録できない' do
      # passwordが空では登録できないテストコードを記述します
      @user.password = 'aaaaaa'
      @user.password_confirmation = 'aaaaaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordが5文字以下では登録できない' do
      # passwordが空では登録できないテストコードを記述します
      @user.password = 'aaa11'
      @user.password_confirmation = 'aaa11'
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is invalid")
    end
    it 'passwordとpassword_confirmationが不一致では登録できない' do
      # passwordとpassword_confirmationが不一致では登録できないテストコードを記述します
      @user.password = Faker::Internet.password(min_length: 100)
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end
    it 'first_nameが英語では登録できない' do
      # first_nameが英語では登録できないテストコードを記述します
      @user.first_name = Faker::Name.last_name
      @user.valid?
      expect(@user.errors.full_messages).to include("First name is invalid")
    end
    it 'last_nameが英語では登録できない' do
      # last_nameが英語では登録できないテストコードを記述します
      @user.last_name = Faker::Name.last_name
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name is invalid")
    end
    it 'first_name_kanaがひらがなでは登録できない' do
      # first_name_kanaがひらがなでは登録できないテストコードを記述します
      @user.first_name_kana = @user.last_name
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it 'last_name_kanaがひらがなでは登録できない' do
      # last_name_kanaがひらがなでは登録できないテストコードを記述します
      @user.last_name_kana = @user.last_name
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
    it 'first_name_kanaが英語では登録できない' do
      # first_name_kanaが英語では登録できないテストコードを記述します
      @user.first_name_kana = Faker::Name.last_name
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana is invalid")
    end
    it 'last_name_kanaが英語では登録できない' do
      # last_name_kanaが英語では登録できないテストコードを記述します
      @user.last_name_kana = Faker::Name.last_name
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana is invalid")
    end
  end
end
