require 'rails_helper'

RSpec.describe Genre, type: :model do
  before do
    @item = FactoryBot.build(:shop)
    @item.image = fixture_file_upload('public/images/バイエンススーツ.jpg')
  end
  
  describe "商品登録" do

   it "すべての値が正常に記載されている場合は登録できる" do
    expect(@item).to be_valid
   end

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

   it "価格は半角数字でなければ登録できない" do
     @item.price = '３００'
     @item.valid?
     expect(@item.errors.full_messages).to include("Price is not a number")
   end

   it "価格は半角英数混合では登録できない" do
     @item.price = '9h90'
     @item.valid?
     expect(@item.errors.full_messages).to include("Price is not a number")
   end

   it "価格は半角英語だけでは登録できない" do
    @item.price = 'eigo'
     @item.valid?
     expect(@item.errors.full_messages).to include("Price is not a number")
   end

   it "画像が空だと登録できない" do
     @item.image = nil
     @item.valid?
     expect(@item.errors.full_messages).to include("Image can't be blank")
   end

   it "userが紐付いていないと保存できない" do
    @item.user = nil
    @item.valid?
    expect(@item.errors.full_messages).to include("User must exist")
   end
  end
end
