class Article < ApplicationRecord
  mount_uploader :image, ImageUploader

  belongs_to :user
  has_many :comments
  has_many :categories
end
