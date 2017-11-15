class ItemCategory < ApplicationRecord
  has_many :items, dependent: :destroy
end
