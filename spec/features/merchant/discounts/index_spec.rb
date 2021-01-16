require 'rails_helper'

describe "merchant discounts index '/merchant/:id/discounts'" do
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
  it "can see all of my bulk discounts including their percentage discount and quantity thresholds listed" do 
    visit merchant_discounts_path(@merchant1.id)

    expect(page).to have_content(@discount1.item_requirement)
    expect(page).to have_content(@discount1.percentage_discount)

    expect(page).to have_content(@discount2.item_requirement)
    expect(page).to have_content(@discount2.percentage_discount)

    expect(page).to have_content(@discount3.item_requirement)
    expect(page).to have_content(@discount3.percentage_discount)

    expect(page).to have_content(@discount4.item_requirement)
    expect(page).to have_content(@discount4.percentage_discount)

    expect(page).to have_content(@discount5.item_requirement)
    expect(page).to have_content(@discount5.percentage_discount)

    expect(page).to_not have_content(@discount6.item_requirement)
    expect(page).to_not have_content(@discount6.percentage_discount)
  end
# And each bulk discount listed includes a link to its show page "



end
