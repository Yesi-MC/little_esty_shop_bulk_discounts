require 'rails_helper'

RSpec.describe Discount, type: :model do
  describe "validations" do
    it { should validate_presence_of :item_requirement }
    it { should validate_presence_of :percentage_discount }
    it { should validate_numericality_of :item_requirement }
    it { should validate_numericality_of :percentage_discount }
  end 
  
  describe "relationships" do
    it { should belong_to :merchant }
  end 

  describe 'methods' do 
    it "can display percentage in readable format (0.20 --> 20%)" do 
      @merchant1 = Merchant.create!(name: 'Hair Care')

      @discount1 = Discount.create!(item_requirement: 5, percentage_discount: 0.20, merchant_id: @merchant1.id)
      @discount2 = Discount.create!(item_requirement: 15, percentage_discount: 0.25, merchant_id: @merchant1.id)

      expect(@discount1.format_percent).to eq(20)
      expect(@discount2.format_percent).to eq(25)
    end
  end
end
