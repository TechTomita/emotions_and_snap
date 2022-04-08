class User < ApplicationRecord
  before_save { self.email.downcase! }
  
  # nilは許さず、50文字以内
  validates :name, presence: true, length: { maximum: 50 }
  # nilは許さず、50文字以内、メールアドレス形式、重複は許さず
  validates :email, presence: true, length: { maximum: 255 },
   format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
   uniqueness: { case_sensitive: false }
  
  has_secure_password
end
