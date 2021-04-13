class PurchaseOrder
  include ActiveModel::Model
  attr_accessor :postal, :area_id, :city, :address, :property, :tell, :item_id, :user_id ,:token

  with_options presence: true do
    validates :token
    validates :postal , format: { with:/\A\d{3}[-]\d{4}\z/ ,message: "はハイフン（ー）を入れてください" }
    validates :area_id , numericality: { other_than: 1  }
    validates :city 
    validates :address 
    validates :tell  , format: { with: /\A\d{10,11}\z/ }
    validates :item_id
    validates :user_id
  end
  validate :property  
  
  def save
   purchase = Purchase.create(item_id: item_id ,user_id: user_id)
   Order.create(postal: postal, area_id: area_id ,city: city, address: address, property: property, tell: tell, purchase_id: purchase.id)
  end
end
