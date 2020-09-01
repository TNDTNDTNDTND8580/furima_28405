class AddressBuy
  include ActiveModel::Model
  extend ActiveHash::Associations::ActiveRecordExtensions

  attr_accessor :price, :token, :user_id,:item_id, :prefecture, :city, :postal_code, :building, :adress, :phon_number, :buy_id,:area_id

  with_options presence: true do
    validates :token
    validates :area_id
    validates :city
    validates :adress
    validates :building
    validates :phon_number
  end

end
