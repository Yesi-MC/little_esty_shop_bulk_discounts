class Discount < ApplicationRecord
  validates_presence_of :item_requirement, :percentage_discount
  validates_numericality_of :item_requirement, :in => 1..100000
  validates_numericality_of :percentage_discount, :greater_than_or_equal_to => 0.01, :less_than_or_equal_to => 1
   
  belongs_to :merchant
end
