class User < ApplicationRecord
  # emailをdowncaseにする
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i
  validates :email, presence: true, length: { maximum: 255 },
            format: { with: VALID_EMAIL_REGEX },
            uniqueness: { case_sensitive: false }
  # 新しくレコードが追加されたときだけに適用される性質を持っている（更新時には処理されない）
  has_secure_password
  validates :password, length: { minimum: 6 }
end
