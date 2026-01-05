class Credential < ApplicationRecord
  self.primary_key = :user_id
  belongs_to :user

  validates :login_id, presence: true, uniqueness: true, length: { minimum: 4 }
  validates :password, presence: true, length: { minimum: 4 }

  # TODO パスワードは暗号化する
end
