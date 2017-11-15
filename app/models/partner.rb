class Partner < ApplicationRecord
  has_many :orders, dependent: :destroy
end
