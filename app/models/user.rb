class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  validates :username, presence: true
  validates :nationality, presence: true
  validates :introduction, length: { maximum: 200 }
  
  has_many :articles, dependent: :destroy
  has_many :comments, dependent: :destroy

  has_many :favorites
  has_many :fav_articles, through: :favorites, source: :article

end
