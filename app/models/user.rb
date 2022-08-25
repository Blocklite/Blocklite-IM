class User < ApplicationRecord
  has_secure_password

  validates :linx, :phone, presence: true
  validates :first_name, :last_name, presence: true, length: { minimum: 2, maximum: 30 }
  validates :email, presence: true, uniqueness: { case_sensitive: true }
  validates_format_of :email, with: /\A\S+@.+\.\S+\z/
  validates :password, presence: true, uniqueness: { case_ewnsitive: true }, length: { minimum: 8 }

  has_many :messages
end