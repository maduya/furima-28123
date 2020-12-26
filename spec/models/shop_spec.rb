require 'rails_helper'

RSpec.describe Genre, type: :model do
  before do
    @item = FactoryBot.build(:shop)
    @item.image = fixture_file_upload('public/images/バイエンススーツ.jpg')
  end
  
  describe "商品登録" do

   it "カテゴリーが空だと登録できない" do
    @item.genre_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Genre must be other than 1")
   end

   it "商品名が空だと登録できない" do
    @item.product_name = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Product name can't be blank")
   end

   it "商品説明が空だと登録できない" do
    @item.product_description = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Product description can't be blank")
   end

   it "発送元の地域が空だと登録できない" do
    @item.prefecture_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Prefecture must be other than 1")
   end

   it "商品の状態が空だと登録できない" do
    @item.sales_status_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Sales status must be other than 1")
   end

   it "配送料の負担が空だと登録できない" do
    @item.shipping_fee_status_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Shipping fee status must be other than 1")
   end

   it "発送までの日数が空だと登録できない" do
    @item.scheduled_delivery_id = 1
    @item.valid?
    expect(@item.errors.full_messages).to include("Scheduled delivery must be other than 1")
   end

   it "価格が空だと登録できない" do
    @item.price = ""
    @item.valid?
    expect(@item.errors.full_messages).to include("Price can't be blank")
   end

   it "価格が¥300~9999999の範囲内でなければ登録できない" do
    @item.price = 100
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be greater than 299")
   end

   it "価格が¥300~9999999の範囲内でなければ登録できない" do
    @item.price = 10000000
    @item.valid?
    expect(@item.errors.full_messages).to include("Price must be less than 10000000")
   end
  end
end
