class StoreSection < ApplicationRecord
  validates :name, presence: true, length: { maximum: 64 }, format: { with: /\A[\w\s]+\z/, message: "only allows letters and whitespaces" }
end
