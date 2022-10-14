require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品機能' do

    context '出品できる場合' do
      it "商品画像、商品名、商品説明、カテゴリー、商品の状態、配送料の負担、発送元、発送までの日数、価格が存在すれば出品できる" do
        expect(@item).to be_valid
      end
    end

    context '出品できない場合' do
      
      it '画像がなければ出品できない' do
        @item.image = nil
        @item.valid?
        expect(@item.errors.full_messages).to include("Image can't be blank")
      end

      it '商品名がなければ出品できない' do
        @item.name = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Name can't be blank")
      end

      it '商品の説明がなければ出品できない' do
        @item.information = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Information can't be blank")
      end

      it 'カテゴリーがなければ出品できない' do
        @item.category_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態の情報がなければ出品できない' do
        @item.condition_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

      it '配送料負担の情報がなければ出品できない' do
        @item.delivery_burden_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Delivery burden can't be blank")
      end

      it '発送元の地域の情報がなければ出品できない' do
        @item.sender_area_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Sender area can't be blank")
      end

      it '発送までの日数の情報がなければ出品できない' do
        @item.schedule_id = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Schedule can't be blank")
      end

      it '価格情報がなければ出品できない' do
        @item.price = ''
        @item.valid?
        expect(@item.errors.full_messages).to include("Price can't be blank")
      end

      it '価格が300円より少なければ出品できない' do
        @item.price = '299'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be greater than or equal to 300")
      end

      it '価格が9,999,999円より多ければ出品できない' do
        @item.price = '10000000'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price must be less than or equal to 9999999")
      end

      it '価格は半角数値でないと出品できない' do
        @item.price = '１２３４'
        @item.valid?
        expect(@item.errors.full_messages).to include("Price is not a number")
      end

      it 'カテゴリーに「---」が選択されている場合は出品できない' do
        @item.category_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Category can't be blank")
      end

      it '商品の状態に「---」が選択されている場合は出品できない' do
        @item.condition_id = '1'
        @item.valid?
        expect(@item.errors.full_messages).to include("Condition can't be blank")
      end

     it '配送料の負担に「---」が選択されている場合は出品できない' do
      @item.delivery_burden_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Delivery burden can't be blank")
     end

     it '発送元の地域に「---」が選択されている場合は出品できない' do
      @item.sender_area_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Sender area can't be blank")
     end

     it '発送までの日数に「---」が選択されている場合は出品できない' do
      @item.schedule_id = '1'
      @item.valid?
      expect(@item.errors.full_messages).to include("Schedule can't be blank")
     end


     it 'userが紐付いていなければ出品できない' do
      @item.user = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('User must exist')
     end




    end

  end

end
