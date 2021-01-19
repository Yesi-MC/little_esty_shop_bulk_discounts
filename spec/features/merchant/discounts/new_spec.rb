require 'rails_helper'

describe "merchant discounts create page '/merchant/:id/discounts/new'" do
  before :each do
    @merchant1 = Merchant.create!(name: 'Hair Care')
    @merchant2 = Merchant.create!(name: 'Jewelry')

    @discount1 = Discount.create!(item_requirement: 10, percentage_discount: 0.20, merchant_id: @merchant1.id)
    @discount2 = Discount.create!(item_requirement: 15, percentage_discount: 0.25, merchant_id: @merchant1.id)
    @discount3 = Discount.create!(item_requirement: 5, percentage_discount: 0.10, merchant_id: @merchant1.id)
    @discount4 = Discount.create!(item_requirement: 20, percentage_discount: 0.40, merchant_id: @merchant1.id)
    @discount5 = Discount.create!(item_requirement: 50, percentage_discount: 0.45, merchant_id: @merchant1.id)
    @discount6 = Discount.create!(item_requirement: 19, percentage_discount: 0.30, merchant_id: @merchant2.id)
  end
  it "can fill in the form with valid data then be redirected back to the discount index" do 
    visit "/merchant/#{@merchant1.id}/discounts/new"

    fill_in :discount_item_requirement, with: "16"
    fill_in :discount_percentage_discount, with: "0.17"

    click_button 

    expect(current_path).to eq(merchant_discounts_path(@merchant1.id))
    expect(page).to have_content('16')
    expect(page).to have_content('0.17')
  end 
  describe "When I DO NOT enter the right information in the discount and I click 'Submit'" do
    before :each do
      visit "/merchant/#{@merchant1.id}/discounts/new"

      fill_in :discount_item_requirement, with: 'ten'
      fill_in :discount_percentage_discount, with: '0.19'

      click_button 
    end

    it 'Then I see a flash message stating that the item did not update' do
      expect(page).to have_content("Discount Incorrectly Entered. Try Again!")
    end

    it "Then I am redirected back to the merchant's discounts new page" do
      
      expect(current_path).to eq("/merchant/#{@merchant1.id}/discounts")
    end
  end 
end 