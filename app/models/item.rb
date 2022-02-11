class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  has_one_attached :image

  belongs_to :category
  belongs_to :condition
  belongs_to :delivery_area
  belongs_to :delivery_date
  belongs_to :postage

  validates :image, :itemname, :introduction, :price, presence: true

  validates :category_id, :condition_id, :postage_id, :delivery_area_id, :delivery_date_id, numericality: { other_than: 1, message: "can't be blank"}

  validates :price, numericality: { only_integer: true, greater_than_or_equal_to: 300, less_than_or_equal_to: 9_999_999 }

  belongs_to :user
  has_one    :buyer

end
