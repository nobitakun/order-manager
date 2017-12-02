class Order < ApplicationRecord
  belongs_to :project
  
  validates :name, presence: true, length: { maximum: 50 }
  validates :discount, length: { maximum: 18 }, numericality: true
  
  has_many :carts, dependent: :destroy
  has_many :line_items, through: :carts
  has_many :partners, through: :line_items
  
  accepts_nested_attributes_for :carts, allow_destroy: true
  
  after_initialize :set_default_discount
  
  def set_default_discount
    self.discount ||= 0
  end
  
end
