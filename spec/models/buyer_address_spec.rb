require 'rails_helper'

RSpec.describe BuyerAddress, type: :model do
  describe '商品購入情報の保存' do
    before do
      user = FactoryBot.create(:user)
      item = FactoryBot.create(:item)
      @buyer_address = FactoryBot.build(:buyer_address,user_id: user.id, item_id: item.id)
      sleep 0.1
    end

    context '商品を購入できる場合' do
      it 'すべての値が正しく入力されていれば購入できること' do
        expect(@buyer_address).to be_valid
      end
      it 'buildingは空でも購入できること' do
        @buyer_address.building = ''
        expect(@buyer_address).to be_valid
      end
    end

    context '商品を購入できない場合' do
      it 'post_codeが空では登録できない' do
        @buyer_address.post_code = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Post code can't be blank")
      end
      it 'post_codeが半角のハイフンを含んだ正しい形式でないと購入できない' do
        @buyer_address.post_code = '1234567'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Post code is invalid. Include hyphen(-)")
      end
      it 'delivery_area_idが未選択(1)では購入できない' do
        @buyer_address.delivery_area_id = 1
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Delivery area can't be blank")
      end
      it 'cityが空では購入できない' do
        @buyer_address.city = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("City can't be blank")
      end
      it 'streetが空では購入できない' do
        @buyer_address.street = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Street can't be blank")
      end
      it 'tel_numberが空では購入できない' do
        @buyer_address.tel_number = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Tel number can't be blank")
      end
      it 'tel_numberが10桁未満では保存できない' do
        @buyer_address.tel_number = '090123456'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Tel number is invalid.")
      end
      it 'tel_numberが12桁以上では保存できない' do
        @buyer_address.tel_number = '090123456789'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Tel number is invalid.")
      end
      it 'tel_numberに半角数値以外を含むと保存できない' do
        @buyer_address.tel_number = '090-123４567'
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Tel number is invalid.")
      end
       it 'userが紐付いていないと購入できない' do
        @buyer_address.user_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("User can't be blank")
       end
       it 'itemが紐付いていないと購入できない' do
        @buyer_address.item_id = nil
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Item can't be blank")
       end
       it 'tokenが空では購入できない' do
        @buyer_address.token = ''
        @buyer_address.valid?
        expect(@buyer_address.errors.full_messages).to include("Token can't be blank")
       end
    end
  end
end