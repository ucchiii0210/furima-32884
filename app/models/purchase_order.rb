class PurchaseOrder
  include ActiveModel::Model
  attr_accessor :postal, :area_id, :city, :address, :property,:tell, :token ,:purchase_id ,:item_id ,:user_id

  with_options presence: true do
    validates :token
    validates :postal , format: { with:/\A\d{3}[-]\d{4}\z/}
    validates :area_id , numericality: { other_than: 1}
    validates :city  
    validates :address  
    validates :tell  , format: { with: /\A\d{10,11}\z/}
  end
  validate :property  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area

  def save
   purchase = Purchase.create(item_id: item_id ,user_id: item_id)
   Order.create(postal: postal, area_id: area_id, city: city, address: address, propety: property, tell: tell, token: token, purchase_id: purchase_id)
  end
end
