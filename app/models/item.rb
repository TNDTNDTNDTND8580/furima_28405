class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  has_one_attached :image
  has_one :buy
  belongs_to :user
  belongs_to_active_hash :category
  belongs_to_active_hash :condition
  belongs_to_active_hash :delivery_fee
  belongs_to_active_hash :area
  belongs_to_active_hash :days_until_shipping

  with_options presence: true do
   validates :image
   validates :item
   validates :introduce
   validates :category_id
   validates :condition_id
   validates :delivery_fee_id
   validates :area_id
   validates :days_until_shipping_id
   validates :price
  end
  validates :price,numericality: { only_integer: true,greater_than: 300, less_than: 9999999}
end