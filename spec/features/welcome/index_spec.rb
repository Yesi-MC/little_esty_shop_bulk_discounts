require 'rails_helper'

RSpec.describe Transaction, type: :feature do
  describe "on the welcome index" do 
    it "can see a link to the admin dashboard and merchant dashboard" do 
      visit root_path

      expect(page).to have_link("Go to Admin Dashboard")
      click_link "Go to Admin Dashboard"
      expect(current_path).to eq(admin_dashboard_index_path)
    end  
  end
end
