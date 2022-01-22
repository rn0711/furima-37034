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

end
