class LineItem < ApplicationRecord
  belongs_to :item
  belongs_to :order
  
  after_initialize :set_default_value
  
  def set_default_value
    self.paid ||= 0
  end
end
