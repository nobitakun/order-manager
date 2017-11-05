class LineItem < ApplicationRecord
  belongs_to :item
  belongs_to :order
  
  validates :user
end
