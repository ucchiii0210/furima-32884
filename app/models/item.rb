class Item < ApplicationRecord

  belongs_to :user
  has_one    :purchase
  has_one_attached :image
  
  with_options presence: true do
    validates :image
    validates :product        
    validates :text 
    with_options numericality: { other_than: 1} do
      validates :category_id  
      validates :status_id  
      validates :sipping_id   
      validates :area_id 
      validates :day_id  
    end
    validates :price 
  end
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :category
  belongs_to :status
  belongs_to :sipping
  belongs_to :area
  belongs_to :day
end
