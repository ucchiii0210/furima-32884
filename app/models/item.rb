class Item < ApplicationRecord

  belongs_to :user
  has_one    :purchase
  
  with_options presence: true do
    validates :image
    validates :product        
    validates :text         
    validates :category_id  
    validates :sipping_id   
    validates :status_id  
    validates :area_id 
    validates :day_id  
    validates :price 
  end
end
