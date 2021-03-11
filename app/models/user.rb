class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
          
         has_many :items
         has_many :purchases

         validates :password,format: { with: /\A(?=.*?[a-zA-Z])(?=.*?[\d])\w{6,100}\z/}

         with_options presence: true do
         validates :nickname 
         validates :first_name, format: {with: /\A[ぁ-んァ-ン一-龥々]+\z/}
         validates :last_name, format: {with: /\A[ぁ-んァ-ン一-龥々]+\z/}
         validates :first_name_kana, format: {with: /\A[ァ-ヶー－]+\z/}
         validates :last_name_kana, format: {with: /\A[ァ-ヶー－]+\z/}
         validates :birthday
         end
end
