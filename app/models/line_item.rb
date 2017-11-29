class LineItem < ApplicationRecord
  belongs_to :item
  belongs_to :order_list
  
  has_many :carts
  has_many :orders, through: :carts
  
  after_initialize :set_default_unit_price
  after_initialize :set_default_quantity
  after_initialize :set_default_paid
  
  def set_default_unit_price
    self.unit_price ||= 0
  end
  
  def set_default_quantity
    self.quantity ||= 0
  end
  
  def set_default_paid
    self.paid ||= 0
  end
end
