class Item < ApplicationRecord
  belongs_to :item_category
  has_many :line_items, dependent: :destroy
end
