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

    within ".discount-#{@discount1.id}" do 
      expect(page).to have_content(@discount1.item_requirement)
      expect(page).to have_content(@discount1.format_percent)
    end 

    within ".discount-#{@discount2.id}" do 
      expect(page).to have_content(@discount2.item_requirement)
      expect(page).to have_content(@discount2.format_percent)
    end 

    within ".discount-#{@discount3.id}" do 
      expect(page).to have_content(@discount3.item_requirement)
      expect(page).to have_content(@discount3.format_percent)
    end 

    within ".discount-#{@discount4.id}" do 
      expect(page).to have_content(@discount4.item_requirement)
      expect(page).to have_content(@discount4.format_percent)
    end 

    within ".discount-#{@discount5.id}" do 
      expect(page).to have_content(@discount5.item_requirement)
      expect(page).to have_content(@discount5.format_percent)
    end 

    expect(page).to_not have_content(@discount6.item_requirement)
    expect(page).to_not have_content(@discount6.format_percent)
  end

  it "can see each bulk discount listed includes a link to its show page" do 
    visit merchant_discounts_path(@merchant1.id)

    within ".discount-#{@discount1.id}" do 
      expect(page).to have_link("View this Discount")
      click_link "View this Discount"
    end 

    expect(current_path).to eq(merchant_discount_path(@merchant1.id, @discount1.id))
  end

  it "can see a link to create a new discount then I am redirected to a new form where I can add a new discount" do 
    visit merchant_discounts_path(@merchant1.id)

    expect(page).to have_link("Create New Discount")
    click_link "Create New Discount"
    expect(current_path).to eq("/merchant/#{@merchant1.id}/discounts/new")
  end

  it "can see a link to delete a bulk discount" do 
    discount7 = Discount.create!(item_requirement: 19, percentage_discount: 0.36, merchant_id: @merchant1.id)

    visit merchant_discounts_path(@merchant1.id)

    within ".discount-#{discount7.id}" do 
      expect(page).to have_button("Delete Discount")
      click_button "Delete Discount"
    end 

    expect(current_path).to eq(merchant_discounts_path(@merchant1.id))
  end 

  it "can see a link to be redirected back to merchant dashboard (merchant/:id/dashboard)" do 
    visit merchant_discounts_path(@merchant1.id)

    click_link "Back to Dashboard" 
    expect(current_path).to eq(merchant_dashboard_index_path(@merchant1.id))
  end
end
