require 'rails_helper'
describe Item do
  describe '#create' do
    before do
      @item = build(:item)
      @item.image = fixture_file_upload('images/test_image.jpg')
    end

    it 'factorybotの内容だと登録ができる事' do
      expect(@item).to be_valid
    end

    it '画像が無い場合は登録ができない事' do
      @item.image = nil
      @item.valid?
      expect(@item.errors[:image]).to include("can't be blank")
    end

    it '商品名が無い場合は登録ができない事' do
      @item.item_name = nil
      @item.valid?
      expect(@item.errors[:item_name]).to include("can't be blank")
    end

    it '商品の説明が無い場合は登録ができない事' do
      @item.item_explanation = nil
      @item.valid?
      expect(@item.errors[:item_explanation]).to include("can't be blank")
    end

    it 'カテゴリー情報が無い場合は登録ができない事' do
      @item.item_category_id = nil
      @item.valid?
      expect(@item.errors[:item_category_id]).to include("can't be blank")
    end

    it 'カテゴリー情報が1の場合は登録ができない事' do
      @item.item_category_id = "1"
      @item.valid?
      expect(@item.errors[:item_category_id]).to include("must be other than 1")
    end

    it '商品の状態についての情報が無い場合は登録ができない事' do
      @item.item_status_id = nil
      @item.valid?
      expect(@item.errors[:item_status_id]).to include("can't be blank")
    end

    it '商品の状態についての情報が1の場合は登録ができない事' do
      @item.item_status_id = "1"
      @item.valid?
      expect(@item.errors[:item_status_id]).to include("must be other than 1")
    end

    it '配送料の負担についての情報が無い場合は登録ができない事' do
      @item.delivery_charge_id = nil
      @item.valid?
      expect(@item.errors[:delivery_charge_id]).to include("can't be blank")
    end

    it '配送料の負担についての情報が1の場合は登録ができない事' do
      @item.delivery_charge_id = '1'
      @item.valid?
      expect(@item.errors[:delivery_charge_id]).to include('must be other than 1')
    end

    it '発送元の地域についての情報が無い場合は登録ができない事' do
      @item.delivery_area_id = nil
      @item.valid?
      expect(@item.errors[:delivery_area_id]).to include("can't be blank")
    end

    it '発送元の地域についての情報が1の場合は登録ができない事' do
      @item.delivery_area_id = '1'
      @item.valid?
      expect(@item.errors[:delivery_area_id]).to include('must be other than 1')
    end


    it '発送までの日数についての情報が無い場合は登録ができない事' do
      @item.delivery_days_id = nil
      @item.valid?
      expect(@item.errors[:delivery_days_id]).to include("can't be blank")
    end

    it '発送までの日数についての情報が1の場合は登録ができない事' do
      @item.delivery_days_id = '1'
      @item.valid?
      expect(@item.errors[:delivery_days_id]).to include('must be other than 1')
    end

    it '価格についての情報が無い場合は登録ができない事' do
      @item.price = nil
      @item.valid?
      expect(@item.errors[:price]).to include("can't be blank")
    end

    it '価格が¥300未満の場合は登録ができない事' do
      @item.price = '299'
      @item.valid?
      expect(@item.errors[:price]).to include('is not included in the list')
    end

    it '価格が¥9,999,999より大きい場合は登録ができない事' do
      @item.price = '10000000'
      @item.valid?
      expect(@item.errors[:price]).to include('is not included in the list')
    end
  end
end
