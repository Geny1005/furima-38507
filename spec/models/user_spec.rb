require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe '新規登録/ユーザー情報/本人確認情報' do
    context '新規登録できる場合' do
      it "nameとemail、passwordとpassword_confirmationが存在すれば登録できる" do
        expect(@user).to be_valid
      end
    end
    
    context '新規登録できない場合' do
      it 'nicknameが必須であること' do
        @user.nickname = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Nickname can't be blank")
      end

      it 'emailが必須であること' do
        @user.email = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Email can't be blank")
      end

      it 'emailが一意性であること' do
        @user.save
        another_user = FactoryBot.build(:user, email: @user.email)
        another_user.valid?
        expect(another_user.errors.full_messages).to include('Email has already been taken')
      end

      it 'emailは@を含むこと' do
        @user.email = 'testmail'
        @user.valid?
        expect(@user.errors.full_messages).to include('Email is invalid')
      end

      it 'passwordが必須であること' do
        @user.password = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Password can't be blank")
      end
  
      it 'passwordは6文字以上であること' do
        @user.password = 'Aa111'
        @user.password_confirmation = 'Aa1111'
        @user.valid?
        expect(@user.errors.full_messages).to include('Password is too short (minimum is 6 characters)')
      end

      it '英字のみのパスワードでは登録できない' do
        @user.password = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it '数字のみのパスワードでは登録できない' do
        @user.password = '1111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it '全角文字を含むパスワードでは登録できない' do
        @user.password = 'ああああ'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password is invalid")
      end

      it 'パスワードとパスワード（確認）は、値の一致が必須であること' do
        @user.password = 'Aa1111'
        @user.password_confirmation = 'Aa11111'
        @user.valid?
        expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
      end

      it 'お名前(全角)は、名字が必須であること。' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")

      end
      it 'お名前(全角)は、名前が必須であること。' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end
      
      it '苗字(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。' do
        @user.last_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it '名前(全角)は、全角（漢字・ひらがな・カタカナ）での入力が必須であること。' do
        @user.first_name = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it 'お名前カナ(全角)は、名字が必須であること。' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it 'お名前カナ(全角)は、名前が必須であること。' do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it '苗字カナ(全角)は、全角（カタカナ）での入力が必須であること。' do
        @user.last_name_kana = ''
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it '名前カナ(全角)は、全角（カタカナ）での入力が必須であること。' do
        @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana is invalid")
      end

      it '生年月日が必須であること。' do
        @user.birth_date = ''
        @user.valid?
          expect(@user.errors.full_messages).to include("Birth date can't be blank")
      end

      it '苗字（全角）に半角文字が含まれていると登録できない' do
        @user.last_name = 'aaaa'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name is invalid")
      end

      it '名前（全角）に半角文字が含まれていると登録できない' do
        @user.first_name = 'aaaa'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name is invalid")
      end

      it '苗字（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.last_name_kana = 'あ漢a@'
        @user.valid?
        expect(@user.errors.full_messages).to include("Last name kana is invalid")
      end

      it '名前（カナ）にカタカナ以外の文字（平仮名・漢字・英数字・記号）が含まれていると登録できない' do
        @user.first_name_kana = 'あ漢a@'
        @user.valid?
        expect(@user.errors.full_messages).to include("First name kana is invalid")
      end




    end
  end  
end
