require 'rails_helper'

RSpec.describe UserOrder, type: :model do
  before do
    @user_order = FactoryBot.build(:user_order)
  end

  describe '商品購入' do
    context '商品購入がうまく行く時'
    it '全ての値が揃っている時住所登録できる' do
      expect(@user_order).to be_valid
    end
  end

  context '商品購入がうまく行かない時' do
    it 'クレジットカード情報が空では決済できないこと' do
    end
    
    it 'クレジットカードの有効期限が空では決済できないこと'do
      
    end

    it 'クレジットカードのセキュリティコードが空では決済できないこと'do
      
    end

    it '郵便番号が空では決済できないこと'do
      @user_order.postal_code = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Postal codeが入力されていません。", "Postal code-を使用してください")
    end

    it '都道府県が空では決済できないこと'do
      @user_order.prefecture = 1
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Prefectureは1以外の値にしてください")
    end

    it '市区町村が空では決済できないこと'do
      @user_order.municipalities = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Municipalitiesが入力されていません。")
    end

    it '番地が空では決済できないこと'do
      @user_order.address = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include("Addressが入力されていません。")
    end

    it '電話番号が空では決済できないこと'do
      @user_order.phone_number = ''
      @user_order.valid?
      expect(@user_order.errors.full_messages).to include('Phone number半角数字を使用してください')
    end
  end
end
