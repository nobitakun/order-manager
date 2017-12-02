class ItemCategory < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :item_categories, through: :items
  
  validates :name, presence: true, length: { maximum: 50 }
end
