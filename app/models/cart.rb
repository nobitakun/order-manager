class Cart < ApplicationRecord
  belongs_to :order
  belongs_to :line_item
  
  validates :order_id, presence: true
  validates :line_item_id, presence: true
end
