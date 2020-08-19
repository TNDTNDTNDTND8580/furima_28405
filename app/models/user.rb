class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  with_options presence: true do
    validates :nickname, presence: true
    validates :familyname, :firstname, presence: true
    validates :phonetic_familyname, :phonetic_firstname, presence: true
    validates :birthday, presence: true
    
  end
  
  str = [(/\A[ぁ-んァ-ン一-龥]/),/[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/]
  with_options format: true do
    validates :familyname, :firstname, format: str[0]
    validates :phonetic_familyname, :phonetic_firstname, format: str[1]
  end
end
