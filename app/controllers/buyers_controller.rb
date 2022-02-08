class BuyersController < ApplicationController
  before_action :authenticate_user!, only: [:index, :create]
  before_action :set_item, only: [:index, :create]

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
  end

    private

    def buyer_params
      params.require(:buyer_address).permit(:post_code, :delivery_area_id, :city, :street, :building, :tel_number).merge(user_id: current_user.id, item_id: @item.id, token: params[:token])
    end

    def set_item
      @item = Item.find(params[:item_id])
      @buyers = Buyer.all
    end

    def pay_item
      Payjp.api_key = ENV['PAYJP_SECRET_KEY']
      Payjp::Charge.create(
        amount: @item.price,
        card: buyer_params[:token],
        currency: 'jpy'
      )
    end
end
