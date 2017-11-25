class Order < ApplicationRecord
  belongs_to :partner
  belongs_to :project
  
  has_many :carts
  has_many :line_items, through: :carts
  
  accepts_nested_attributes_for :carts, allow_destroy: true
end
