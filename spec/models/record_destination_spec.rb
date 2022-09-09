require 'rails_helper'

RSpec.describe RecordDestination, type: :model do
  describe '配送先情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @record_destination = FactoryBot.build(:record_destination, user_id: user.id, item_id: item.id)
      sleep 1.0
    end

    context '内容に問題がない場合' do
      it 'すべての情報が正しく入力されていれば保存できる' do
        expect(@record_destination).to be_valid
      end
      it 'building_nameは空でも保存できる' do
        @record_destination.building_name = ''
        expect(@record_destination).to be_valid
      end
    end

    context '内容に問題がある場合' do
      it '郵便番号が空では保存できない' do
        @record_destination.post_code = ''
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("Post code can't be blank")
      end
      it '郵便番号が全角では保存できない' do
        @record_destination.post_code = '１２３-４５６７'
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("Post code is invalid")
      end
      it '郵便番号にハイフンがないと保存できない' do
        @record_destination.post_code = 1234567
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("Post code is invalid")
      end
      it '都道府県が1では保存できない' do
        @record_destination.region_id = 1
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("Region can't be blank")
      end
      it '市区町村が空では保存できない' do
        @record_destination.municipality = ''
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("Municipality can't be blank")
      end
      it '番地が空では保存できない' do
        @record_destination.address = ''
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("Address can't be blank")
      end
      it '電話番号が空では保存できない' do
        @record_destination.phone_number = ''
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("Phone number can't be blank")
      end
      it '電話番号が全角では保存できない' do
        @record_destination.phone_number = '１２３４５６７８９０'
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号にハイフンがあると保存できない' do
        @record_destination.phone_number = '123-456-7890'
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が10桁未満では保存できない' do
        @record_destination.phone_number = 123456789
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("Phone number is invalid")
      end
      it '電話番号が12桁以上では保存できない' do
        @record_destination.phone_number = 12345678901234
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("Phone number is invalid")
      end
      it 'トークンが空では保存できない' do
        @record_destination.token = ''
        @record_destination.valid?
        expect(@record_destination.errors.full_messages).to include("Token can't be blank")
      end
    end
  end
end
