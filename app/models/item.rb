class Item < ApplicationRecord
  belongs_to :item_category, optional: true
  has_many :line_items, dependent: :destroy
  
  validates :item_category_id, presence: true
  validates :name, presence: true, length: { maximum: 50 }
  validates :unit, presence: true
end
