class Article < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user

  has_many :comments

  has_many :article_tags, dependent: :destroy
  has_many :tags, through: :article_tags

  has_many :favorites
  has_many :fav_users, through: :favorites, source: :user

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end
end
