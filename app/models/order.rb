class Order < ApplicationRecord
  belongs_to :project
  
  has_many :carts, dependent: :destroy
  has_many :line_items, through: :carts
  has_many :partners, through: :line_items
  
  accepts_nested_attributes_for :carts, allow_destroy: true
end
