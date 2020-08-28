require 'rails_helper'

RSpec.describe Item, type: :model do
  let(:image) { FactoryBot.create(:image) }
  before do
    @item = FactoryBot.build(:item)
    @item.image = fixture_file_upload('test_image.png')
  end
  describe '商品出品情報' do
    context 'can save' do
      it '画像は1枚必須であること' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end
      it '商品名が必須であること' do
        @item.item = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Item can't be blank")    
      end
      it '商品の説明が必須であること' do
        @item.introduce = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Introduce can't be blank")
      end
      it 'カテゴリーの情報が必須であること' do
        @item.category_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end
      it '商品の状態についての情報が必須であること' do
        @item.condition_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end
      it '配送料の負担についての情報が必須であること' do
        @item.delivery_fee_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery fee can't be blank")
      end
      it '発送元の地域についての情報が必須であること' do
        @item.area_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Area can't be blank")
      end
      it '発送までの日数についての情報が必須であること' do
        @item.days_until_shipping_id = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Days until shipping can't be blank")
      end
      it '価格についての情報が必須であること' do
        @item.price = ""
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end
      
    end
    context 'cant save' do
      it "商品価格が300円未満ではないこと" do
        @item.price = 299
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than 300")
      end
      it "商品価格が1000万円以上ではないこと" do
        @item.price = 10000000
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than 9999999")
      end
    end
  end
end

