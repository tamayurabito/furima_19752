require 'rails_helper'
describe PurchaceAddress do
  describe '#save' do
    before do
      @purchaceaddress = build(:purchace_address)
    end

    it 'factory_botで作成したインスタンスの内容だと登録ができる事' do
      expect(@purchaceaddress).to be_valid
    end

    it '郵便番号がない場合は登録ができない事' do
      @purchaceaddress.postal_code = nil
      @purchaceaddress.valid?
      expect(@purchaceaddress.errors[:postal_code]).to include("can't be blank")
    end

    it '郵便番号にハイフン(-)がない場合は登録ができない事' do
      @purchaceaddress.postal_code = 123_456
      @purchaceaddress.valid?
      expect(@purchaceaddress.errors[:postal_code]).to include('is invalid')
    end

    it '都道府県が選択されていない場合は登録ができない事' do
      @purchaceaddress.delivery_area_id = nil
      @purchaceaddress.valid?
      expect(@purchaceaddress.errors[:delivery_area_id]).to include("can't be blank")
    end

    it '都道府県についての情報が1の場合は登録ができない事' do
      @purchaceaddress.delivery_area_id = 1
      @purchaceaddress.valid?
      expect(@purchaceaddress.errors[:delivery_area_id]).to include('must be other than 1')
    end

    it '市区町村がない場合は登録ができない事' do
      @purchaceaddress.citys = nil
      @purchaceaddress.valid?
      expect(@purchaceaddress.errors[:citys]).to include("can't be blank")
    end

    it '番地がない場合は登録ができない事' do
      @purchaceaddress.addresses = nil
      @purchaceaddress.valid?
      expect(@purchaceaddress.errors[:addresses]).to include("can't be blank")
    end

    it '電話番号がない場合は登録ができない事' do
      @purchaceaddress.phone_number = nil
      @purchaceaddress.valid?
      expect(@purchaceaddress.errors[:phone_number]).to include("can't be blank")
    end

    it '電話番号が11桁より大きい場合は登録ができない事' do
      @purchaceaddress.phone_number = 123_456_789_012
      @purchaceaddress.valid?
      expect(@purchaceaddress.errors[:phone_number]).to include('is too long (maximum is 11 characters)')
    end
  end
end
