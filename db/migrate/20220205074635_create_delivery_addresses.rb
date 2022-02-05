class CreateDeliveryAddresses < ActiveRecord::Migration[6.0]
  def change
    create_table :delivery_addresses do |t|
      t.string     :post_code,        null: false
      t.integer    :delivery_area_id, null: false
      t.string     :city,             null: false
      t.string     :street,           null: false
      t.string     :building
      t.string     :tel_number,       null: false
      t.references :buyer,            null: false, foreign_key: true
      t.timestamps
    end
  end
end
