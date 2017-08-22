class Shoe < ActiveRecord::Base
  belongs_to :seller, class_name: "User", required: true
  belongs_to :buyer, class_name: "User"

  validates :name, presence: true, length: { in: 2..30 }
  validates :price, presence: true
end
