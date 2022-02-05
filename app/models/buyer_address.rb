class BuyerAddress
  include ActiveModel::Model
  attr_accessor :post_code, :delivery_area_id, :city, :street, :building, :tel_number, :user_id, :item_id

  with_options presence: true do
    validates :post_code, format: { with: /\A[0-9]{3}-[0-9]{4}\z/, message: 'is invalid. Include hyphen(-)' }
    validates :city
    validates :street
    validates :tel_number, format: { with: /\A[0-9]{10..11}\z/, message: "is invalid. Include hyphen(-)" }
    validates :user_id
    validates :item_id
  end
  validates :delivery_area_id, numericality: { other_than: 1, message: "can't be blank" }

  def save
    buyer = Buyer.create(user_id: user_id, item_id: item_id)
    DeliveryAddress.create(post_code: post_code, delivery_area_id: delivery_area_id, city: city, streer: street, building: building, tel_number: tel_number, buyer_id: buyer_id)
  end
end
