class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  validates :nickname, presence: true
  validates :familyname, :firstname, presence: true
  validates :phonetic_familyname, :phonetic_firstname, presence: true
  validates :familyname, :firstname, format: (/\A[ぁ-んァ-ン一-龥]/)
  validates :phonetic_familyname, :phonetic_firstname, format: /[\p{katakana}　ー－&&[^ -~｡-ﾟ]]+/
  validates :birthday, presence: true
end
