class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :postal    ,null: false
      t.integer :area_id  ,null: false
      t.string :city      ,null: false
      t.string :address
      t.string :property  ,null: false
      t.string :tell      ,null: false
      t.references :purchase , foreign_key: true
      t.timestamps
    end
  end
end
