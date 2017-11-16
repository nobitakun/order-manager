class Project < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  
  has_many :orders, dependent: :destroy
  has_many :line_items, through: :orders
  
  def order(partner)
    partner.create(partner_id: partner.id)
  end
end
