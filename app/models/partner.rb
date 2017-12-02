class Partner < ApplicationRecord
  has_many :line_items, dependent: :destroy, inverse_of: :partner
end
