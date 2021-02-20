class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

  with_options presence: true do
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  validates :nickname
  validates :birthday
    with_options format: {with: /\A[ぁ-んァ-ン一-龥]/, message: 'には全角漢字・ひらがな・カタカナで入力してください'} do
      validates :first_name 
      validates :second_name
    end
    
    with_options format: {with: /\A[ァ-ヶー－]+\z/,message: 'には全角カナで入力してください'} do
      validates :first_name_kana
      validates :second_name_kana
    end
  end
end

