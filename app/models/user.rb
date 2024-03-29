class User < ApplicationRecord
  has_many :items
  has_many :orders

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  validates :password, format: {
  with: /\A(?=.*?[a-z])(?=.*?[\d])[a-z\d]+\z/i
},on: :create
  validates :nickname, presence: true
  validates :last_name, presence: true, format: {
      with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
    }
  validates :first_name, presence: true, format: {
      with: /\A[ぁ-んァ-ヶ一-龥々ー]+\z/
    }
  validates :last_name_kana, presence: true, format: {
    with: /\A([ァ-ン]|ー)+\z/
  }
  validates :first_name_kana, presence: true, format: {
    with: /\A([ァ-ン]|ー)+\z/
  }
  validates :birthday, presence: true
end
