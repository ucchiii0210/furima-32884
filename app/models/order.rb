class Order < ApplicationRecord

  belongs_to :purchase

  with_options presence: true do
    validates :postal , format: { with:/\A\d{3}[-]\d{4}\z/}
    validates :area_id , numericality: { other_than: 1}
    validates :city  
    validates :address  
    validates :tell  , format: { with: /\A\d{10,11}\z/}
  end
  validates :property  
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :area
end
