class Item < ApplicationRecord
  validates_presence_of :name,
                        :description,
                        :unit_price,
                        :merchant_id

  has_many :invoice_items
  has_many :invoices, through: :invoice_items
  belongs_to :merchant
  has_many :discounts, through: :merchant


  enum status: [:disabled, :enabled]

  def best_day
    invoices
    .joins(:invoice_items)
    .where('invoices.status = 2')
    .select('invoices.*, sum(invoice_items.unit_price * invoice_items.quantity) as money')
    .group(:id)
    .order("money desc", "created_at desc")
    .first
    .created_at
    .to_date
  end

  def find_discount(item_quantity)
    discount = get_discount(item_quantity) 
    if !discount.empty? 
      1 - discount[0].percentage_discount
    else
      1
    end
  end

  def price_with_discount(number_of_items, inv_itm)
    inv_itm.unit_price * find_discount(number_of_items)  
  end

  def get_discount(item_quantity) 
    discounts.where("item_requirement <= #{item_quantity}").order(percentage_discount: :desc).limit(1)
  end
end
