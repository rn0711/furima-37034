class BuyersController < ApplicationController
  before_action :authenticate_user!, except: :index

  def index
    @buyer_address = BuyerAddress.new
  end

  def create
    @buyer_address = BuyerAddress.new(buyer_params)
    if @buyer_address.valid?
      pay_item
      @buyer_address.save
      redirect_to root_path
    else
      render :index
    end

    private

    def buyer_params
      params.require(:buyer_address).permit(:post_code, :delivery_area_id, :city, :street, :building, :tel_number).merge(user_id: current_user.id, item_id: @item.id)
end
