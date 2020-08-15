require 'rails_helper'

RSpec.describe User, type: :model do
  ##pending "add some examples to (or delete) #{__FILE__}"
  before do
    @user = FactoryBot.build(:user)
  end
  describe 'ユーザー情報' do
  
    it 'ニックネームが必須であること' do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end
    it 'メールアドレスが必須であること' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")    
    end
    it 'メールアドレスが一意性であること' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end
    it 'メールアドレスが@を含む必要があること' do
      @user.email = "test.test"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end
    it 'パスワードが必須であること' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
    end
    it 'パスワードは６文字以上であること' do
      @user.password = "00000"
      @user.password_confirmation = "00000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end
    it 'パスワードは半角英数字混合であること' do
      @user.password.match(/\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i)
      @user.valid?
    end
    it 'パスワードは確認用を含めて2回入力すること' do
      @user.password_confirmation = "00000"
      @user.valid?
    end
  end

  describe '本人確認情報' do
    
    
    it 'ユーザー本名が、名字と名前がそれぞれ必須であること' do
      @user.familyname = ''
      @user.firstname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Familyname can't be blank", "Firstname can't be blank")
    end
    it 'ユーザー本名は全角（漢字・ひらがな・カタカナ）で入力させること' do
      @user.familyname = 'aaa'
      @user.firstname = 'aaa'
      @user.valid?
      expect(@user.errors.full_messages).to include("Familyname is invalid", "Firstname is invalid")
    end
    it 'ユーザー本名のフリガナが、名字と名前でそれぞれ必須であること' do
      @user.phonetic_familyname = ''
      @user.phonetic_firstname = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Phonetic familyname can't be blank", "Phonetic firstname can't be blank")
    end
    it 'ユーザー本名のフリガナは全角（カタカナ）で入力させること' do
      @user.phonetic_familyname = 'あああ'
      @user.phonetic_firstname = 'あああ'
      @user.valid?
      expect(@user.errors.full_messages).to include("Phonetic familyname is invalid", "Phonetic firstname is invalid")
    end
    it '生年月日が必須であること' do
      @user.birthday = ''
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
