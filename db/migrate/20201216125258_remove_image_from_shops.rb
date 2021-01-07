class RemoveImageFromShops < ActiveRecord::Migration[6.0]
  def change
    remove_column :shops, :image, :text
  end
end
