class Snap < ApplicationRecord
  validates :title, presence: true, length: { maximum: 50 }
  validates :description, presence: true, length: { maximum: 255 }
  validates :image, presence: true
  
  mount_uploader :image, ImageUploader
  
  belongs_to :user
  
  has_many :favorite_relationships, dependent: :destroy
  # userを取得
  has_many :favorite_users, through: :favorite_relationships, source: :user
  
  has_many :comments, dependent: :destroy
end
