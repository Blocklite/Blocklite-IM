class User < ApplicationRecord
  has_secure_password

  validates :first_name, :last_name, presence: true, length: { minimum: 2, maximum: 30 }
  validates :email, presence: true, uniqueness: { case_sensitive: true }
  validates_format_of :email, with: /\A\S+@.+\.\S+\z/
  validates :password, presence: true, uniqueness: { case_ewnsitive: true }, length: { minimum: 8 }

  has_many :messages

  before_create :add_linx

  def add_linx
    unless linx.present?
      @linx = Linx.new(linx_type: self.class.name)
      @linx.save
      self.linx = @linx.linx
    end
  end
end
