class Item < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to_active_hash :condition
  has_one_attached :photo
  #空の投稿を保存できないようにする
  # validates :presence: true
  belongs_to :user

end
