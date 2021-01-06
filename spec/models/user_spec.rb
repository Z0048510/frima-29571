require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザの新規登録' do
    context '正常時' do
      it 'カラムが全てバリデーション通りに入力されれば登録できる' do
        expect(@user).to be_valid
      end
    end

    context '異常時' do
      it 'nicknameが空だと登録できない' do
        @user.nickname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが空だと登録できない' do
        @user.email = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it '登録済のnicknameだと登録できない' do
        dummy = FactoryBot.create(:user)
        @user.nickname = dummy.nickname
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname has already been taken")
      end

      it '登録済のemailだと登録できない' do
        dummy = FactoryBot.create(:user)
        @user.email = dummy.email
        @user.valid?
        expect(@user.errors.full_messages).to include("Email has already been taken")
      end

      it 'emailに@がないと登録できない' do
        @user.email = 'dummy.co.jp'
        @user.valid?
        expect(@user.errors.full_messages).to include("Email is invalid")
      end

      it 'passwordが空だと登録できない' do
        @user.password = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end

      it 'passwordとpassword_confirmationが一致しないと登録できない' do
        @user.password_confirmation = 'dummy'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'passwordが６文字以上でないと登録できない' do
        @user.password = 'dummy'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
      end

      it 'passwordに英字が含まれていないと登録できない' do
        @user.password = '1234567'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end

      it 'passwordに数字が含まれていないと登録できない' do
        @user.password = 'dummydummy'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end

      it 'passwordが全角だと登録できない' do
        @user.password = 'ダミーパスワード'
        @user.password_confirmation = @user.password
        @user.valid?
        expect(@user.errors.full_messages).to include("Password Include both letters and numbers")
      end

      it 'firstnameが空だと登録できない' do
        @user.firstname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname can't be blank")
      end

      it 'familynameが空だと登録できない' do
        @user.familyname = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname can't be blank")
      end

      it 'firstnameascが空だと登録できない' do
        @user.firstnameasc = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstnameasc can't be blank")
      end

      it 'familynameascが空だと登録できない' do
        @user.familynameasc = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Familynameasc can't be blank")
      end

      it 'firstnameが半角だと登録できない' do
        @user.firstname = 'dummy'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstname Full-width characters")
      end

      it 'firstnameascが半角だと登録できない' do
        @user.firstnameasc = 'ダミー'
        @user.valid?
        expect(@user.errors.full_messages).to include("Firstnameasc Full-width katakana characters")
      end

      it 'familynameが半角だと登録できない' do
        @user.familyname = 'dummy'
        @user.valid?
        expect(@user.errors.full_messages).to include("Familyname Full-width characters")
      end

      it 'familynameascが半角だと登録できない' do
        @user.familynameasc = 'ダミー'
        @user.valid?
        expect(@user.errors.full_messages).to include("Familynameasc Full-width katakana characters")
      end

      it 'birthdayが空だと登録できない' do
        @user.birthday = nil
        @user.valid?
        expect(@user.errors.full_messages).to include("Birthday can't be blank")
      end
    end
  end
end
