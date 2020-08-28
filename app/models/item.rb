class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  has_one_attached :image
  belongs_to :user

  validates :image,presence: true
  validates :item, presence: true
  validates :introduce, presence: true
  validates :category_id, presence: true
  validates :condition_id, presence: true
  validates :delivery_fee_id, presence: true
  validates :area_id,presence: true
  validates :days_until_shipping_id,presence: true
  validates :price,numericality: { only_integer: true,greater_than: 300, less_than: 9999999}
end

# validate :image_presence

# def image_presence
  
# end