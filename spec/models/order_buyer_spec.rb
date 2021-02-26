require 'rails_helper'

RSpec.describe OrderBuyer, type: :model do
  before do
    user = FactoryBot.create(:user)
    item = FactoryBot.create(:item)
    @order_buyer = FactoryBot.build(:order_buyer, user_id: user.id, item_id: item.id)
    sleep(1)
  end
  
  describe '#create' do
    context '商品購入ができる場合' do
      it '商品情報、クレジット情報全て入力済みあれば購入できる（建物名は任意）' do
        expect(@order_buyer).to be_valid
      end
      it '建物名がなくても購入できる' do
        @order_buyer.building_name = ""
        expect(@order_buyer).to be_valid
      end
    end

    context '商品購入ができない場合' do
      it '郵便番号が空では購入できない' do
        @order_buyer.postal_code = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Postal code can't be blank")
      end
      it '郵便番号にハイフンを入れないと購入できない' do
        @order_buyer.postal_code = '1234567'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Postal code is invalid. Include hyphen(-)")
      end
      it '都道府県が空では購入できない' do
        @order_buyer.prefecture_id = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Prefecture is not a number")
      end
      it '都道府県がid(1)では投稿できない' do
        @order_buyer.prefecture_id = 1
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Prefecture must be other than 1")
      end
      it '市区町村が空では購入できない' do
        @order_buyer.municipality = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空では購入できない' do
        @order_buyer.address = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では購入できない' do
        @order_buyer.phone_number = ''
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号にハイフンがあると購入できない' do
        @order_buyer.phone_number = '090-1234-5678'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone number ハイフンなし、半角数字で入力して下さい")
      end
      it '電話番号が半角数字以外では購入できない' do
        @order_buyer.phone_number = '０９０１２３４５６７８'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone number ハイフンなし、半角数字で入力して下さい")
      end
      it '電話番号が半角数字以外の文字が入っている場合でも購入できない' do
        @order_buyer.phone_number = 'あいうえお//..aa'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone number ハイフンなし、半角数字で入力して下さい")
      end
      it '電話番号が英数混合では購入できない' do
        @order_buyer.phone_number = 'a1a1a1a1a1a'
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Phone number ハイフンなし、半角数字で入力して下さい")
      end
      it "tokenが空では登録できないこと" do
        @order_buyer.token = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Token can't be blank")
      end
      it "item_idが空では登録できないこと" do
        @order_buyer.item_id = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("Item can't be blank")
      end
      it "user_idが空では登録できないこと" do
        @order_buyer.user_id = nil
        @order_buyer.valid?
        expect(@order_buyer.errors.full_messages).to include("User can't be blank")
      end
    end
  end
end


