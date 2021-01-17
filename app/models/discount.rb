class Discount < ApplicationRecord
  validates_presence_of :item_requirement, :percentage_discount
  belongs_to :merchant
end
