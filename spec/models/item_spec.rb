require 'rails_helper'

RSpec.describe Item, type: :model do
  before do
    @item = FactoryBot.build(:item)
  end

  describe '商品出品' do
    context '商品出品がうまくいくとき'
    it '全ての値が揃っている時登録できる' do
      expect(@item).to be_valid
    end
  end

  context '商品出品がうまくいかないとき' do
    it '商品画像を1枚つけないと登録できない' do
      @item.image = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('画像が入力されていません。')
    end

    it 'nameが空では登録できない' do
      @item.name = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('商品名が入力されていません。')
    end
    it 'introductionが空では登録できない' do
      @item.introduction = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の説明が入力されていません。')
    end
    it 'genre_idが空では登録できない' do
      @item.genre_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('カテゴリーは数値で入力してください')
    end

    it 'genre_idが1では登録できない' do
      @item.genre_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('カテゴリーは1以外の値にしてください')
    end
    it 'status_idが空では登録できない' do
      @item.status_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の状態は数値で入力してください')
    end

    it 'status_idが1では登録できない' do
      @item.status_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('商品の状態は1以外の値にしてください')
    end

    it 'distribution_idが空では登録できない' do
      @item.distribution_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('配送料の負担は数値で入力してください')
    end

    it 'distribution_idが1では登録できない' do
      @item.distribution_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('配送料の負担は1以外の値にしてください')
    end

    it 'region_idが空では登録できない' do
      @item.region_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('発送元の地域は数値で入力してください')
    end

    it 'region_idが1では登録できない' do
      @item.region_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('発送元の地域は1以外の値にしてください')
    end

    it 'term_idが空では登録できない' do
      @item.term_id = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('発送までの日数は数値で入力してください')
    end

    it 'term_idが1では登録できない' do
      @item.term_id = 1
      @item.valid?
      expect(@item.errors.full_messages).to include('発送までの日数は1以外の値にしてください')
    end

    it 'priceが空では登録できない' do
      @item.price = nil
      @item.valid?
      expect(@item.errors.full_messages).to include('価格が入力されていません。', '価格半角数字を使用してください', '価格は数値で入力してください')
    end
    it '価格の範囲が、¥300~¥9,999,999の間でないと登録できない' do
      @item.price = 100
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は299より大きい値にしてください')
    end
    it '価格の範囲が、¥300~¥9,999,999の間でないと登録できない' do
      @item.price = 100_000_000
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は100000000より小さい値にしてください')
    end
    it '販売価格は半角数字のみでないと登録できない' do
      @item.price = 'aaaaaaa'
      @item.valid?
      expect(@item.errors.full_messages).to include('価格は数値で入力してください')
    end
  end
end
