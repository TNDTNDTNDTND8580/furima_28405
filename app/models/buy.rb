class Buy < ApplicationRecord
  validates :price, presence: true
  validates :token, presence: true
  belongs_to :item
  belongs_to :user
  has_one :address
end