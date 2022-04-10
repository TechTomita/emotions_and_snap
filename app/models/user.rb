class User < ApplicationRecord
  before_save { self.email.downcase! }
  
  # nilは許さず、50文字以内
  validates :name, presence: true, length: { maximum: 50 }
  # nilは許さず、50文字以内、メールアドレス形式、重複は許さず
  validates :email, presence: true, length: { maximum: 255 },
   format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
   uniqueness: { case_sensitive: false }
  
  has_secure_password
  
  has_many :snaps
  has_many :favorite_relationships
  # snapを取得
  has_many :favorite_snaps, through: :favorite_relationships, source: :snap
  
  def favorite(snap)
    self.favorite_relationships.find_or_create_by(snap_id: snap.id)
  end
  
  def unfavorite(snap)
    favorite_relationship = self.favorite_relationships.find_by(snap_id: snap.id)
    favorite_relationship.destroy if favorite_relationship
  end
  
  def favorite?(snap)
    self.favorite_snaps.include?(snap)
  end
end
