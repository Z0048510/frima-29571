require 'rails_helper'

RSpec.describe Product, type: :model do
  before do
    @product = FactoryBot.build(:product)
    @product.image = fixture_file_upload('images/test_image.png')
  end

  describe '商品の出品(DB登録)' do

    context '正常時' do
      it 'カラムが全てバリデーション通りに入力されれば登録できる' do
        expect(@product).to be_valid
      end
    end

    context '異常時' do
      it 'imageが空だと登録できない' do
        @product.image = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Image can't be blank")
      end

      it 'productnameが空だと登録できない' do
        @product.productname = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Productname can't be blank")
      end

      it 'amountが空だと登録できない' do
        @product.amount = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Amount can't be blank")
      end

      it 'amountが299以下だと登録できない' do
        @product.amount = 299
        @product.valid?
        expect(@product.errors.full_messages).to include("Amount Out of setting range")
      end

      it 'amountが10000000以上だと登録できない' do
        @product.amount = 10000000
        @product.valid?
        expect(@product.errors.full_messages).to include("Amount Out of setting range")
      end

      it 'amountが全角だと登録できない' do
        @product.amount = '３００'
        @product.valid?
        expect(@product.errors.full_messages).to include("Amount Half-width number")
      end

      it 'descriptionが空だと登録できない' do
        @product.description = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Description can't be blank")
      end

      it 'category_idが空だと登録できない' do
        @product.category_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Category Select")
      end

      it 'status_idが空だと登録できない' do
        @product.status_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Status Select")
      end

      it 'payment_idが空だと登録できない' do
        @product.payment_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Payment Select")
      end

      it 'area_idが空だと登録できない' do
        @product.area_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Area Select")
      end

      it 'day_idが空だと登録できない' do
        @product.day_id = nil
        @product.valid?
        expect(@product.errors.full_messages).to include("Day Select")
      end

    end
  end
end
