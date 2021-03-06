class Invoice < ApplicationRecord
  validates_presence_of :status,
                        :merchant_id,
                        :customer_id

  belongs_to :merchant
  belongs_to :customer
  has_many :transactions
  has_many :invoice_items
  has_many :items, through: :invoice_items

  enum status: [:cancelled, :in_progress, :complete]

  def total_revenue
    invoice_items.sum do |ii|
      discount = ii.item.find_discount(ii.quantity)
      ii.unit_price * ii.quantity * discount
    end 
  end

end