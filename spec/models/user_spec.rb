require 'rails_helper'

RSpec.describe User, type: :model do
  before do
    @user = FactoryBot.build(:user)
  end

  describe 'ユーザー新規登録' do

    it 'nicknameが空では登録できない' do
      @user.nickname = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Nickname can't be blank")
    end

    it 'emailが空では登録できない' do
      @user.email = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Email can't be blank")
    end

    it 'emailが重複したら登録できない' do
      @user.save
      another_user = FactoryBot.build(:user)
      another_user.email = @user.email
      another_user.valid?
      expect(another_user.errors.full_messages).to include("Email has already been taken")
    end

    it 'emailに＠がなければ登録できない' do
      @user.email = "kkkgmail.com"
      @user.valid?
      expect(@user.errors.full_messages).to include("Email is invalid")
    end

    it 'passwordが空では登録できない' do
      @user.password = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password can't be blank")
      end

    it 'passwordが5文字以下では登録できない' do
      @user.password = "0000a"
      @user.password_confirmation = "0000a"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password is too short (minimum is 6 characters)")
    end

    it 'passwordが半角数字のみだと登録できない' do
      @user.password = "000000"
      @user.password_confirmation = "000000"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を6文字以上含めて設定してください")
    end

    it 'passwordが半角英字のみだと登録できない' do
      @user.password = "aaaaaa"
      @user.password_confirmation = "aaaaaa"
      @user.valid?
      expect(@user.errors.full_messages).to include("Password には英字と数字の両方を6文字以上含めて設定してください")
    end

    it 'password_confirmationが空では登録できない' do
      @user.password_confirmation = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Password confirmation doesn't match Password")
    end

    it 'first_name_kanjiが空では登録できない' do
      @user.first_name_kanji = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji can't be blank", "First name kanji には全角(漢字・ひらがな・カタカナ）文字を使用してください")
    end

    it 'first_name_kanjiが全角（漢字・ひらがな・カタカナ）以外だとユーザー登録できない' do
      @user.first_name_kanji = "１１１"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kanji には全角(漢字・ひらがな・カタカナ）文字を使用してください")
    end

    it 'last_name_kanjiが空では登録できない' do
      @user.last_name_kanji = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji can't be blank", "Last name kanji には全角(漢字・ひらがな・カタカナ）文字を使用してください")
    end

    it 'last_name_kanjiが全角（漢字・ひらがな・カタカナ）以外だとユーザー登録できない' do
      @user.last_name_kanji = "１１１"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kanji には全角(漢字・ひらがな・カタカナ）文字を使用してください")
    end

    it 'first_name_kanaが空では登録できない' do
      @user.first_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana can't be blank", "First name kana には全角カナを使用してください")
    end

    it 'first_name_kanaが全角（カタカナ）以外だと登録できない' do
      @user.first_name_kana = "あああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("First name kana には全角カナを使用してください")
    end

    it 'last_name_kanaが空では登録できない' do
      @user.last_name_kana = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana can't be blank", "Last name kana には全角カナを使用してください")
    end

    it 'last_name_kanaが全角（カタカナ）以外だと登録できない' do
      @user.last_name_kana = "あああ"
      @user.valid?
      expect(@user.errors.full_messages).to include("Last name kana には全角カナを使用してください")
    end

    it 'birthdayが空では登録できない' do
      @user.birthday = ""
      @user.valid?
      expect(@user.errors.full_messages).to include("Birthday can't be blank")
    end
  end
end
