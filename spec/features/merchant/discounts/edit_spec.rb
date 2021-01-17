require 'rails_helper'

describe "merchant discounts edit page '/merchant/:id/discounts/:id/edit'" do
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
  it "can click submit I am redirected to the bulk discount's show page & the discount's attributes have been updated" do 
    visit "/merchant/#{@merchant1.id}/discounts/#{@discount1.id}/edit"

    fill_in :discount_item_requirement, with: "18"
    fill_in :discount_percentage_discount, with: "0.19"
    
    click_button 

    expect(current_path).to eq("/merchant/#{@merchant1.id}/discounts/#{@discount1.id}")
    expect(page).to have_content('18')
    expect(page).to have_content('0.19')
  end
end 
  



  # Then I am taken to a new page with a form to edit the discount
  # And I see that the discounts current attributes are prepoluated in the form
  # When I change any/all of the information and click submit
  # Then I am redirected to the bulk discount's show page
  # And I see that the discount's attributes have been updated