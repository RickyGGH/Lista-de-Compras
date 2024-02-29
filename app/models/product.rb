class Product < ApplicationRecord
  belongs_to :store_section
  validates :name, presence: true, length: { maximum: 128 }, format: { without: /[%$&@+|]/, message: "cannot contain special characters like %$&@+|" }
  validates :purchase_date, presence: true
  validates :store_name, length: { maximum: 64 }, allow_blank: true
  validates :store_section_id, presence: true, numericality: { only_integer: true }
  validates :purchased, inclusion: { in: [true, false] }
  validates :quantity, presence: true, numericality: { only_integer: true }
end