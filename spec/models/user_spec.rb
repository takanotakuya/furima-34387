require 'rails_helper'
  RSpec.describe User, type: :model do
    describe '#create' do
      before do
        @user = FactoryBot.build(:user)
      end

      context '新規登録できるとき' do
        it "ユーザー情報全ての項目が存在すれば登録できる" do
          expect(@user).to be_valid
        end
      end
      context '新規登録できないとき' do
        it "ニックネームが空では登録できない" do
          @user.nickname = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Nickname can't be blank") 
        end
        it "メールアドレスが空では登録できない" do
          @user.email = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Email can't be blank")
        end
        it "メールアドレスが一意性であること" do
          @user.save
          another_user = FactoryBot.build(:user, email: @user.email)
          another_user.valid?
          expect(another_user.errors.full_messages).to include("Email has already been taken")
        end
        it "メールアドレスは、@を含む必要があること" do
          @user.email = '@'
          @user.valid?
          expect(@user.errors.full_messages).to include("Email is invalid")
        end
        it "パスワードが空では登録できない" do
          @user.password = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Password can't be blank")
        end
        it "パスワードは、5文字以下では登録できない" do
          @user.password ='12345'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
        end
        it "パスワードは、半角英数字混合での入力でないと登録できない" do
          @user.password ='123abc'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "パスワードとパスワード（確認用）は、値の一致しないと登録できない" do
          @user.password = '123456'
          @user.password_confirmation = '1234567'
          @user.valid?
          expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
        end
        it "ユーザー本名は、名字が空では登録できない" do
          @user.first_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name には全角漢字・ひらがな・カタカナで入力してください") 
        end
        it "ユーザー本名は、名前が空では登録できない" do
          @user.second_name = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Second name には全角漢字・ひらがな・カタカナで入力してください") 
        end
        it "ユーザー本名（名字）は、全角（漢字・ひらがな・カタカナ）での入力でないと登録できない" do
          @user.first_name = 'a1.'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name には全角漢字・ひらがな・カタカナで入力してください") 
        end
        it "ユーザー本名（名前）は、全角（漢字・ひらがな・カタカナ）での入力でないと登録できない" do
          @user.second_name = 'a1.'
          @user.valid?
          expect(@user.errors.full_messages).to include("Second name には全角漢字・ひらがな・カタカナで入力してください") 
        end
        it "ユーザー本名のフリガナは、名字が空では登録できない" do
          @user.first_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana には全角カナで入力してください")
        end
        it "ユーザー本名のフリガナは、名前が空では登録できない" do
          @user.second_name_kana = ''
          @user.valid?
          expect(@user.errors.full_messages).to include("Second name kana には全角カナで入力してください")
        end
        it "ユーザー本名のフリガナ（名字）は、全角（カタカナ）での入力でないと登録できない" do
          @user.first_name_kana = '漢字a1.'
          @user.valid?
          expect(@user.errors.full_messages).to include("First name kana には全角カナで入力してください")
        end
        it "ユーザー本名のフリガナ（名前）は、全角（カタカナ）での入力でないと登録できない" do
          @user.second_name_kana = '漢字a1.'
          @user.valid?
          expect(@user.errors.full_messages).to include("Second name kana には全角カナで入力してください")
        end
        it "生年月日が空では登録できない" do
          @user.birthday = ""
          @user.valid?
          expect(@user.errors.full_messages).to include("Birthday can't be blank")
        end
      end
    end
 end