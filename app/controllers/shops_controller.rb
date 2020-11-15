class ShopsController < ApplicationController

  def index
    @users = User.all
  end

  def new
    @users = User.all
  end

  def create
    User.create(user_params)
    if @user.valid?
      @user.save
      redirect_to root_path
    else
      #保存されなければ、newに戻る
      render 'new'
    end
  end

  def edit
  end

  def show
  end

  private

  def user_params
    params.require(:user)
  end
end
