class CreateOrders < ActiveRecord::Migration[6.0]
  def change
    create_table :orders do |t|
      t.string :postal
      t.integer :area_id
      t.string :city
      t.string :address
      t.string :property
      t.string :tell
      # t.references :purchase , foreign_key: true
      t.timestamps
    end
  end
end
