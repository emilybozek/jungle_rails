class Order < ApplicationRecord


  has_many :line_items
  def calc_totals
    self.total = 0
    line_items.each do |op|
      self.total += op.product.price * op.qty
      op.item_price = op.product.price
      op.item_total = op.product.price * op.qty
    end
  end

  monetize :total_cents, numericality: true

  validates :stripe_charge_id, presence: true
  
end
