class AdressBuy
  include ActiveModel::Model
  extend ActiveHash::Associations::ActiveRecordExtensions

  attr_accessor :user_id,:item_id, :prefecture, :city, :postal_code, :building, :adress, :phon_number, :area_id, :token

  # validates :phon_number, presence: true, format: {/\A(((0(\d{1}[-(]?\d{4}|\d{2}[-(]?\d{3}|\d{3}[-(]?\d{2}|\d{4}[-(]?\d{1}|[5789]0[-(]?\d{4})[-)]?)|\d{1,4}\-?)\d{4}|0120[-(]?\d{3}[-)]?\d{3})\z/}
  # validates :postal_code, presence: true, format: {/\A\d{3}[-]\d{4}\z/}
  with_options presence: true do
    validates :area_id
    validates :city
    validates :adress
    validates :phon_number
  end

  def save
    buy = Buy.create(user_id:user_id, item_id:item_id)
    Adress.create(prefecture: prefecture, city:city, postal_code:postal_code, building:building, adress:adress, phon_number:phon_number, buy_id:buy.id)
 
  end

end
