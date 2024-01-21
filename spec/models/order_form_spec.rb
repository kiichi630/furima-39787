require 'rails_helper'

RSpec.describe OrderForm, type: :model do
  before do
    @order_form = FactoryBot.build(:order_form)
  end

  describe '配送先情報の保存' do
    context '配送先情報の保存ができるとき' do
      it 'すべての値が正しく入力されていれば保存できる' do
        expect(@order_form).to be_valid
      end
    end
    context '配送先情報が保存できないとき' do
      it 'user_idが空では保存できない' do
        @order_form.user_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("User can't be blank")
      end
      it 'item_idが空では登録できない' do
        @order_form.item_id = nil
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Item can't be blank")
      end
      it '郵便番号が空では登録できない' do
        @order_form.post_code = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号にハイフンがないと登録できない' do
        @order_form.post_code = '1234567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '郵便番号が３桁ハイフン４桁以外では登録できない' do
        @order_form.post_code = '1234-567'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '郵便番号が全角数字では登録できない' do
        @order_form.post_code = '１２３−４５６７'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it '都道府県が空では登録できない' do
        @order_form.area_id = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Area can't be blank")
      end
      it '都道府県が初期値のでは登録できない' do
        @order_form.area_id = '1'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Area must be other than 1")
      end
      it '市区町村が空では登録できない' do
        @order_form.municipalities = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Municipalities can't be blank")
      end
      it '番地が空では登録できない' do
        @order_form.street_address = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Street address can't be blank")
      end
      it '電話番号が空では登録できない' do
        @order_form.telephone_number = ''
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone number can't be blank")
      end
      it '電話番号にハイフンがあると登録できない' do
        @order_form.telephone_number = '123-4567-8910'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone number is invalid. Include hyphen(-)")
      end
      it '電話番号が１０桁未満では登録できない' do
        @order_form.telephone_number ='123456789'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone number is invalid. Include hyphen(-)")
      end
      it '電話番号が１２桁以上では登録できない' do
        @order_form.telephone_number ='123456789123'
        @order_form.valid?
        expect(@order_form.errors.full_messages).to include("Telephone number is invalid. Include hyphen(-)")
      end
    end
  end
end