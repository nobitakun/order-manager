class LineItem < ApplicationRecord
  belongs_to :item
  belongs_to :order_list
  
  has_many :carts
  has_many :orders, through: :carts
  
  after_initialize :set_default_value
  
  def set_default_value
    self.paid ||= 0
  end
end
