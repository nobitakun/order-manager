class ItemCategory < ApplicationRecord
  has_many :items, dependent: :destroy
  has_many :item_categories, through: :items
end
