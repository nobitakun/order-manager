class Order < ApplicationRecord
  belongs_to :partner
  belongs_to :project
  
  has_many :line_items, dependent: :destroy
  has_many :items, through: :line_items
  
  accepts_nested_attributes_for :line_items, allow_destroy: true
end
