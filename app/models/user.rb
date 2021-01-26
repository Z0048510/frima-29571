class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :products
  has_many :purchases
  has_many :messages

  # nickname が空で入力されないバリデート
  validates :nickname, presence: true, uniqueness: { case_sensitive: true }

  # birthday が空で入力されないバリデート
  validates :birthday, presence: true

  # password が英数字で入力されるバリデート
  validates :password, presence: true,
                       format: { with: /\A(?=.*?[a-z])(?=.*\d)[a-z\d]+\z/i, message: 'Include both letters and numbers' }

  # 名前 が全角かなで入力されるバリデート
  with_options presence: true, format: { with: /\A[ぁ-んァ-ヶ一-龥々]+\z/, message: 'Full-width characters' } do
    validates :firstname
    validates :familyname
  end

  # カナ が全角カナで入力されるバリデート
  with_options presence: true, format: { with: /\A[ァ-ヶ]+\z/, message: 'Full-width katakana characters' } do
    validates :firstnameasc
    validates :familynameasc
  end
end
