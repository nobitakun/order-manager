class LineItem < ApplicationRecord
  belongs_to :item, optional: true
  belongs_to :order_list
  belongs_to :partner, optional: true
  
  validates :partner_id, presence: true
  validates :item_id, presence: true
  validates :unit_price, presence: true, length: { maximum: 18 }, numericality: true
  validates :quantity, presence: true, length: { maximum: 18 }, numericality: true
  validates :paid, presence: true, length: { maximum: 18 }, numericality: true
  
  has_many :carts, dependent: :destroy
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
