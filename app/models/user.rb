class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         with_options presence: true, format: { with: /\A[ぁ-んァ-ン一-龥]+\z/, message: 'には全角(漢字・ひらがな・カタカナ）文字を使用してください' } do
          validates :first_name_kanji, presence: true
          validates :last_name_kanji, presence: true
         end
         with_options presence: true, format: { with: /\A[ァ-ヶー－]+\z/, message: 'には全角カナを使用してください' } do
          validates :first_name_kana, presence: true
          validates :last_name_kana, presence: true
         end
         with_options presence: true do
          validates :nickname
          PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z{6,}/i.freeze
          validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を6文字以上含めて設定してください' 
          EMAIL_REGEX = /\A[\w+-.]+@[a-z\d-]+(.[a-z\d-]+)*.[a-z]+\z/i.freeze
          validates :email, uniqueness: true, format: { with: EMAIL_REGEX }
          validates :birthday 
         end
end