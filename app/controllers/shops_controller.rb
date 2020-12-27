class ShopsController < ApplicationController
  before_action :authenticate_user!, only: [:create, :edit, :show, :update, :destroy, :new]
  
  def index
    #@item = Shop.all
  end

  def new
    @item = Shop.new
    
  end

  def create
    @item = Shop.new(item_params)
    if @item.save
      redirect_to root_path
    else
      #保存されなければ、newに戻る
      render 'shops/new'
    end
  end

  def edit
  end

  def show
    
  end

  private

  def item_params # form_with 1  params 1
    params.require(:shop).permit(:product_name,:image, :sales_status_id, :shipping_fee_status_id, :prefecture_id, :genre_id, :scheduled_delivery_id, :product_description, :price)
  end
end
