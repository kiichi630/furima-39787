require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do
    context '新規登録ができる場合' do
      it '内容に問題がないとき登録できる' do
        expect(@user).to be_valid
      end
    end
    context '新規登録できない場合' do
      it 'nicknameが空では登録できない' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("ニックネームを入力してください")
      end
      it 'emailが空では登録できない' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールを入力してください")
      end
      it '重複したemailが存在する場合は登録できない' do
        @user.save
        another_user = FactoryBot.build(:user)
        another_user.email = @user.email
        another_user.valid?
        expect(another_user.errors.full_messages).to include("Eメールはすでに存在します")
      end
      it 'emailは@を含まないと登録できない' do
        @user.email = 'test.com'
        @user.valid?
        expect(@user.errors.full_messages).to include("Eメールは不正な値です")
      end
      it 'passwordが空では登録できない' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワードを入力してください")
      end
      it 'passwordとoassword_confirmationが不一致では登録できない' do
        @user.password = '123abc'
        @user.password_confirmation = '1234abcd'
        @user.valid?
        expect(@user.errors.full_messages).to include("パスワード（確認用）とパスワードの入力が一致しません")
      end
      it 'passwordが5文字以下では登録できない' do
        @user.password = Faker::Lorem.characters(number: 5, min_alpha: 1, min_numeric: 1)
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは6文字以上で入力してください')
      end
      it 'passwordが129文字以上では登録できない' do
        @user.password = Faker::Lorem.characters(number: 129, min_alpha: 1, min_numeric: 1)
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは128文字以内で入力してください')
      end
      it '英字のみのpasswordでは登録出来ない' do
        @user.password = 'abcdef'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it '数字のみのpasswordでは登録出来ない' do
        @user.password = '123456'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it '全角文字を含むpasswordでは登録出来ない' do
        @user.password = '１２３abc'
        @user.valid?
        expect(@user.errors.full_messages).to include('パスワードは不正な値です')
      end
      it 'first_nameが空では登録出来ない' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字を入力してください")
      end
      it 'first_nameは、全角（漢字・ひらがな・カタカナ）でないと登録出来ない' do
        @user.first_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字は不正な値です')
      end
      it 'last_nameが空では登録出来ない' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前を入力してください")
      end
      it 'last_nameは、全角（漢字・ひらがな・カタカナ）でないと登録出来ない' do
        @user.last_name = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前は不正な値です')
      end
      it 'first_name_kanaが空では登録出来ない' do
        @user.first_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("苗字（カナ）を入力してください")
      end
      it 'first_name_kanaは、全角（カタカナ）でないと登録出来ない' do
        @user.first_name_kana = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('苗字（カナ）は不正な値です')
      end
      it 'last_name_kanaが空では登録出来ない' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("名前（カナ）を入力してください")
      end
      it 'last_name_kanaは、全角（カタカナ）でないと登録出来ない' do
        @user.last_name_kana = 'test'
        @user.valid?
        expect(@user.errors.full_messages).to include('名前（カナ）は不正な値です')
      end
      it 'birthdayが空では登録出来ない' do
        @user.birthday = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("誕生日を入力してください")
      end
    end
  end
end
