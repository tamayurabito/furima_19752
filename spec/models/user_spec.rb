require 'rails_helper'
describe User do
  describe '#create' do
    before do
      @user = build(:user)
    end
    it 'nickname,email,password,password_confirmation,last_name,first_name,last_name_hurigana,first_name_hurigana,birthdayが全てあると登録できること' do
      expect(@user).to be_valid
    end

    it 'nicknameが無い場合は登録できないこと' do
      @user.nickname = nil
      @user.valid?
      expect(@user.errors[:nickname]).to include("can't be blank")
    end

    it 'emailが無い場合は登録できないこと' do
      @user.email = nil
      @user.valid?
      expect(@user.errors[:email]).to include("can't be blank")
    end

    it 'emailが重複している場合は登録できないこと' do
      user = create(:user)
      another_user = build(:user, email: user.email)
      another_user.valid?
      expect(another_user.errors[:email]).to include('has already been taken')
    end

    it 'emailに＠が含まれていない場合は登録できないこと' do
      @user.email = 'abc'
      @user.valid?
      expect(@user.errors[:email]).to include('is invalid')
    end

    it 'passwordが無い場合は登録できないこと' do
      @user.password = nil
      @user.password_confirmation = nil
      @user.valid?
      expect(@user.errors[:password]).to include("can't be blank")
    end

    it 'passwordが５文字以下の場合は登録できないこと' do
      @user.password = 'xcvb1'
      @user.password_confirmation = 'xcvb1'
      @user.valid?
      expect(@user.errors[:password]).to include('is too short (minimum is 6 characters)')
    end

    it 'passwordが６文字以上の場合は登録できること' do
      @user.password = 'xcvb12'
      @user.password_confirmation = 'xcvb12'
      expect(@user).to be_valid
    end

    it 'passwordが英字のみの場合は登録できないこと' do
      @user.password = 'xcvbnm'
      @user.password_confirmation = 'xcvbnm'
      @user.valid?
      expect(@user.errors[:password]).to include('is invalid')
    end

    it 'passwordが数字のみの場合は登録できないこと' do
      @user.password = '123456'
      @user.password_confirmation = '123456'
      @user.valid?
      expect(@user.errors[:password]).to include('is invalid')
    end

    it 'password_confirmation（パスワード(確認)）が空欄の場合は登録できないこと' do
      @user.password_confirmation = ''
      @user.valid?
      expect(@user.errors[:password_confirmation]).to include("doesn't match Password")
    end

    it 'first_nameに半角が含まれる場合は登録できないこと' do
      @user.first_name = 'あa'
      @user.valid?
      expect(@user.errors[:first_name]).to include('is invalid')
    end

    it 'last_nameに半角が含まれる場合は登録できないこと' do
      @user.last_name = 'あa'
      @user.valid?
      expect(@user.errors[:last_name]).to include('is invalid')
    end

    it 'first_name_huriganaにカタカナ以外が含まれる場合は登録できないこと' do
      @user.first_name_hurigana = 'ヤマダやまだ'
      @user.valid?
      expect(@user.errors[:first_name_hurigana]).to include('is invalid')
    end

    it 'last_name_huriganaにカタカナ以外が含まれる場合は登録できないこと' do
      @user.last_name_hurigana = 'ヤマダやまだ'
      @user.valid?
      expect(@user.errors[:last_name_hurigana]).to include('is invalid')
    end

    it 'birthdayが無い場合は登録できないこと' do
      @user.birthday = nil
      @user.valid?
      expect(@user.errors[:birthday]).to include("can't be blank")
    end
  end
end
