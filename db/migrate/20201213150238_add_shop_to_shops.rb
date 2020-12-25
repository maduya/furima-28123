class AddShopToShops < ActiveRecord::Migration[6.0]
  def change
        add_column :shops, :image,                  :text,null: false
        add_column :shops, :product_name,           :text,null: false
        add_column :shops, :product_description,    :text,null: false
        add_column :shops, :genre_id,               :integer,null: false
        add_column :shops, :sales_status_id,        :integer,null: false
        add_column :shops, :shipping_fee_status_id, :integer,null: false
        add_column :shops, :prefecture_id,          :integer,null: false
        add_column :shops, :scheduled_delivery_id,  :integer,null: false
        add_column :shops, :price,                  :integer,null: false
  end
end
