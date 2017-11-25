class OrderList < ApplicationRecord
  belongs_to :project
  
  has_many :line_items, dependent: :destroy
  has_many :items, through: :line_items
  
  accepts_nested_attributes_for :line_items, allow_destroy: true
end
