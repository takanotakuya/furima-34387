class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  PASSWORD_REGEX = /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i.freeze

  with_options presence: true do
  validates_format_of :password, with: PASSWORD_REGEX, message: 'には英字と数字の両方を含めて設定してください'
  end

  with_options presence: true do
  validates :nickname
  validates :birthday
  end
  
  with_options presence: true do
  validates_format_of :first_name, with: /\A[一-龥]+\z/, message: 'には全角漢字で入力してください'
  validates_format_of :second_name, with: /\A[一-龥]+\z/, message: 'には全角漢字で入力してください'
  end

  with_options presence: true do
  validates_format_of :first_name_kana, with: /\A[ァ-ヶー－]+\z/, message: 'には全角カナで入力してください'
  validates_format_of :second_name_kana, with: /\A[ァ-ヶー－]+\z/, message: 'には全角カナで入力してください'
  end
end
