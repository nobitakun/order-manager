class Partner < ApplicationRecord
  has_many :orders, dependent: :destroy
  
  scope :order_kana, -> { order('kana COLLATE "C" ASC') }
end
