class Partner < ApplicationRecord
  has_many :line_items, dependent: :destroy, inverse_of: :partner
  validates :name, presence: true, length: { maximum: 50 }
  validates :kana, presence: true, length: { maximum: 50 }
end
