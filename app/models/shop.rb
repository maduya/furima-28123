class Shop < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :genre
  belongs_to :sales_status
  belongs_to :shipping_fee_status
  belongs_to :prefecture
  belongs_to :scheduled_delivery
  has_one_attached :image
  belongs_to :user
  
  #空の投稿を保存できないようにする
  validates :image, :product_name, :product_description, :price,presence: true

  #ジャンルの選択が「--」の時は保存できないようにする
  with_options presence: true, numericality: { other_than: 1 } do
  validates :genre_id
  validates :sales_status_id
  validates :shipping_fee_status_id
  validates :prefecture_id
  validates :scheduled_delivery_id
  end
  validates :price, numericality: {only_integer:true, greater_than: 299, less_than: 10000000},
  format: { with: /\A[0-9]+\z/}
end
