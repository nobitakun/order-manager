class Project < ApplicationRecord
  belongs_to :user
  
  validates :user_id, presence: true
  
  has_many :order_lists, dependent: :destroy
  has_many :orders, dependent: :destroy
  has_many :line_items, through: :order_lists
  
  after_initialize :set_default_value
  
  def set_default_value
    self.recipt ||= 0
  end
  
  # def order(partner)
  #   partner.create(partner_id: partner.id)
  # end
end
