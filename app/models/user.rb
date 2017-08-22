class User < ActiveRecord::Base
  has_secure_password

  has_many :buyers, class_name: "Shoe", dependent: :destroy, foreign_key: :buyer_id
  has_many :sellers, class_name: "Shoe", dependent: :destroy, foreign_key: :seller_id

  before_save :downcase_input

  validates :first_name, presence: true, length: { in: 2..30 }
  validates :last_name, presence: true, length: { in: 2..30 }
  validates_format_of :first_name, :last_name, with: /\A[-a-z]+\Z/i
  validates :email, presence: true, uniqueness: true, format: { with: /\A[\w+\-.]+@[a-z\d\-]+(\.[a-z\d\-]+)*\.[a-z]+\z/i }
  validates :password, length: { minimum: 4 }

  def downcase_input
    self.first_name.downcase!
    self.last_name.downcase!
    self.email.downcase!
  end
end
